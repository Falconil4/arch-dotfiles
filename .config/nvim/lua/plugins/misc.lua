return {
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require('bufferline').setup()
		end,
	},
	{
		'marko-cerovac/material.nvim',
		config = function()
			require('material').setup({
				plugins = {
					"flash",
					"nvim-cmp",
					"mini",
					"which-key",
				}
			})
		end
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { 'lua', 'jsonc', 'html', 'css', 'scss', 'javascript', 'typescript', 'vue', 'angular', 'c_sharp' }
			})
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		'windwp/nvim-ts-autotag',
		lazy = false,
		config = function()
			require('nvim-ts-autotag').setup()
		end,
	},
	{
		'folke/ts-comments.nvim',
		event = "VeryLazy",
		opts = {},
	},
	{
		'xiyaowong/transparent.nvim',
		lazy = false,
		config = function()
			require('transparent').setup({
				extra_groups = { 'NormalFloat' }
			})
			require('transparent').clear_prefix('BufferLine')
		end
	},
	{
		"sbdchd/neoformat",
		lazy = false
	},
	{
		"github/copilot.vim",
	}
}
