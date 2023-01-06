-- format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({filter = function(client) return client.name == 'null-ls' end})]])

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- when stuff is yanked, highlight it rq
autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 100,
    })
  end,
})
