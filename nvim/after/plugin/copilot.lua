vim.g.copilot_no_tab_map = false
vim.g.copilot_assume_mapped = true

vim.g.copilot_filetypes = {
  ["TelescopePrompt"] = false,
}

-- i don't think this works..
vim.keymap.set("i", "<C-Space>", "<Plug>(copilot-dismiss)", { noremap = false })

vim.keymap.set("n", "<leader>gd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>ge", ":Copilot enable<CR>")

vim.keymap.set("i", "<C-g>", "<Plug>(copilot-suggest)")

vim.keymap.set("i", "<C-j>", "copilot#Accept()", { expr = true })
