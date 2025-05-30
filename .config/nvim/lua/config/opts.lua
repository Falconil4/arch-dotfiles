if (os.getenv('WSL_INTEROP') ~= nil) then
	vim.g.clipboard = {
		name = 'WslClipboard',
		copy = {
			['+'] = 'clip.exe',
			['*'] = 'clip.exe',
		},
		paste = {
      ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.spell = false
vim.opt.signcolumn = 'yes'
vim.g.snacks_animate = false
vim.diagnostic.config({ virtual_text = true })
