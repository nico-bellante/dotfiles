vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- i don't think this works..
vim.keymap.set("i", "<C-Space>", "<Plug>(copilot-dismiss)", { noremap = false })

vim.keymap.set("n", "<leader>gd", ":Copilot disable<CR>")
vim.keymap.set("n", "<leader>ge", ":Copilot enable<CR>")

vim.keymap.set("i", "<C-g>", "<Plug>(copilot-suggest)")
