vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = "*",
    callback = function() vim.lsp.buf.format() end
  }
)

vim.api.nvim_create_autocmd({ "LspAttach", "InsertLeave" },
  {
    pattern = "*",
    callback = function() vim.lsp.codelens.refresh() end,
  }
)

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
