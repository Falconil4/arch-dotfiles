-- basics
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('i', '<C-s>', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Buffer left' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Buffer down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Buffer up' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Buffer right' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up with center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down with center' })
vim.keymap.set('n', 'gp', '<C-o>', { desc = 'Go previous' })
vim.keymap.set('n', '<S-h>', ':bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<Leader>bc', ':bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<Leader>bo', ':BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
vim.keymap.set('x', 'p', 'pgvy', { desc = 'Improved paste' });

-- snacks
vim.keymap.set('n', '<Leader>gg', function() require('snacks.lazygit').open() end, { desc = 'Toggle Lazygit' })
vim.keymap.set('n', '<Leader>e', function() require('snacks.explorer').open() end, { desc = 'Toggle explorer' })
vim.keymap.set('n', '<Leader>ff', function() require('snacks.picker').files() end, { desc = 'Find files' })
vim.keymap.set('n', '<Leader>fF', function() require('snacks.picker').git_files() end, { desc = 'Find (git) files' })
vim.keymap.set('n', '<Leader>fw', function() require('snacks.picker').grep() end, { desc = 'Find words' })
vim.keymap.set('n', 'gr', function() require('snacks').picker.lsp_references() end,
	{ desc = "References", nowait = true })
vim.keymap.set('n', 'gd', function() require('snacks').picker.lsp_definitions() end, { desc = "Go to definition" })
vim.keymap.set('n', 'gD', function() require('snacks').picker.lsp_declarations() end, { desc = "Go to declarations" })
vim.keymap.set('n', 'gi', function() require('snacks').picker.lsp_implementations() end,
	{ desc = "Go to implementations" })

-- lsp saga
vim.keymap.set('n', '<Leader>a', ':Lspsaga code_action<CR>', { desc = 'Code action' })
vim.keymap.set('n', '<Leader>r', ':Lspsaga rename<CR>', { desc = 'Rename symbol' })
vim.keymap.set('n', 'ge', ':Lspsaga diagnostic_jump_next<CR>', { desc = 'Next diagnostic' })

-- dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "Run debug" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "Step out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<Leader>B', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<Leader>v', function() require('dapui').toggle() end, { desc = "Toggle debug UI" })

-- flash
vim.keymap.set('n', 's', function() require('flash').jump() end, { desc = 'Flash' })

-- trouble
vim.keymap.set('n', '<Leader>tt', ':Trouble diagnostics toggle<CR>', { desc = 'Toggle diagnostics window' })
vim.keymap.set('n', '<Leader>tb', ':Trouble diagnostics toggle filter.buf=0<CR>',
	{ desc = 'Toggle diagnostics window (buffer)' })
vim.keymap.set('n', '<Leader>te', ':Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>',
	{ desc = 'Toggle diagnostics window (errors)' })
