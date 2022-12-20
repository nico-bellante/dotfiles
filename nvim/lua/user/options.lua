local opt = vim.opt
local g = vim.g

-- TODO: make this more x-platform
g.python3_host_prog = "/home/linuxbrew/.linuxbrew/bin/python3.10"

opt.title = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.wrap = false

-- numbers
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 50

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false -- highlight all matches
opt.incsearch = true

opt.scrolloff = 8 -- dont put me near the edge if possible
opt.signcolumn = "yes"
opt.isfname:append("@-@")
