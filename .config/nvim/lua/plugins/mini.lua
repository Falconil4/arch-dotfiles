return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.ai').setup()
		require('mini.pairs').setup()
		require('mini.surround').setup({
			mappings = {
				add = 'gsa', -- Add surrounding in Normal and Visual modes
				delete = 'gsd', -- Delete surrounding
				replace = 'gsr', -- Replace surrounding
				find = '', -- Find surrounding (to the right)
				find_left = '', -- Find surrounding (to the left)
				highlight = '', -- Highlight surrounding
				update_n_lines = '', -- Update `n_lines`
				suffix_last = '', -- Suffix to search with "prev" method
				suffix_next = '', -- Suffix to search with "next" method
			},
		})
	end
}
