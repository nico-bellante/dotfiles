vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set("i", ";;", "<Esc>A;<Esc>")
vim.keymap.set("i", ",,", "<Esc>A,<Esc>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- open corresponding css modules
vim.keymap.set("n", "<leader>cm", "<cmd> :vsplit %<.module.css <CR>")

-- execute this buffer
vim.keymap.set("n", "<C-b>", ":!./%<CR>")

-- save
vim.keymap.set("n", "<C-s>", ":w<CR>")
