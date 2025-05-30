return {
	{
		'mfussenegger/nvim-dap',
		config = function()
			local dap = require('dap')

			-- Set up the .NET Core debugger (netcoredbg)
			dap.adapters.coreclr = {
				type = 'executable',
				command = 'netcoredbg',
				args = { '--interpreter=vscode' },
			}

			-- Function to get the application name dynamically from the .csproj
			local function get_running_app_name()
				-- Find all .csproj files in the current directory and subdirectories
				local project_files = vim.fn.glob('**/*.csproj', false, true)

				if #project_files == 0 then
					print('No .csproj files found')
					return nil
				end

				-- Iterate through each .csproj file and check for the running process
				for _, project_file in ipairs(project_files) do
					-- Extract the AssemblyName or OutputName from the .csproj file
					local handle = io.popen('grep -oP "(?<=<AssemblyName>).*?(?=</AssemblyName>)" ' ..
						project_file)
					local app_name = handle:read('*a')
					handle:close()

					-- If AssemblyName is not found, fall back to using the project name (file name)
					if app_name == '' then
						app_name = vim.fn.fnamemodify(project_file, ':t:r') -- Get the base name without extension
					end

					-- Use the app_name to find the process associated with this .csproj
					local pid = nil

					-- Check if we're on Linux/macOS or Windows
					if vim.fn.has('unix') == 1 then
						-- On Linux/macOS, use 'ps' to find the PID
						pid = vim.fn.system("ps aux | grep '" ..
							app_name .. "' | grep -v 'grep' | awk '{print $2}' | head -n 1")
					elseif vim.fn.has('win32') == 1 then
						-- On Windows, use 'tasklist' to find the PID
						pid = vim.fn.system(
							"tasklist /FI \"IMAGENAME eq dotnet.exe\" /FI \"WINDOWTITLE eq " ..
							app_name .. "*\" /NH | awk '{print $2}'")
					end

					-- Trim any whitespace
					pid = vim.fn.trim(pid)

					if pid ~= '' then
						return pid, app_name -- Found the matching running process
					end
				end

				return nil, nil -- No matching running process found
			end

			-- Configuration for attaching to a running .NET Core process
			dap.configurations.cs = {
				{
					name = 'Attach to .NET Core Web API',
					type = 'coreclr',
					request = 'attach',
					processId = function()
						-- Try to get the running process and its application name
						local pid, app_name = get_running_app_name()

						if not pid then
							print(
								'No running .NET Core process found matching the .csproj files')
							return nil
						end

						print('Attaching to process: ' .. app_name .. ' with PID: ' .. pid)
						return tonumber(pid) -- Return the PID to attach the debugger
					end,
					cwd = '${workspaceFolder}',
					stopAtEntry = false, -- Set to true to break at the entry point
				}
			}
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio"
		},
		config = function()
			require('dapui').setup({
				layouts = {
					{
						position = "bottom",
						size = 20,
						elements = {
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
							{
								id = "scopes",
								size = 0.5,
							},
						}
					}
				}
			})

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end
	},
}
