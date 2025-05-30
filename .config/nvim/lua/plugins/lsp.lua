return {
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function() require('lsp_signature').setup() end,
	},
	{
		'williamboman/mason.nvim',
		config = function() require('mason').setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		}) end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 'lua_ls', 'vue_ls', 'ts_ls', 'html', 'cssls', 'angularls', 'jsonls' },
			})
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig_defaults = require('lspconfig').util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lspconfig_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)
		end,
	},
	{
		'hrsh7th/cmp-nvim-lsp',
	},
	{
		'hrsh7th/nvim-cmp',
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'path' },
				},
				snippet = {
					expand = function(args)
						vim.snippet.expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-j>'] = cmp.mapping.select_next_item(),
					['<C-k>'] = cmp.mapping.select_prev_item(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<Tab>'] = cmp.mapping.confirm({ select = true }),

				}),
				completion = {
					completeopt = 'menu,menuone,noinsert'
				},
			})
		end
	},
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({
				lightbulb = { enable = false }
			})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		}
	},
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		opts = {},
	}
}
