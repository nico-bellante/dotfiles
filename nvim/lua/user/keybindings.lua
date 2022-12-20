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

-- move things around in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better line joining
vim.keymap.set("n", "J", "mzJ`z")

-- better half page jumping with cursor in middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- better search nav keeping cursor in middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- leader y to yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- for real this shouldn't exist
vim.keymap.set("n", "Q", "<nop>")

-- formattings
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make this executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
