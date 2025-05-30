vim.lsp.config['ts_ls'] = {
	init_options = {
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vim.fn.expand("$MASON/packages/vue-language-server"),
				languages = { 'vue' },
			},
		},
	},
	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}
