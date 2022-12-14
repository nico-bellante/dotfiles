-- Install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require("packer").init({
  compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "solid" })
    end,
  },
})

-- Install plugins
local use = require("packer").use

use("wbthomason/packer.nvim") -- Let packer manage itself

-- essentials
use("nvim-lua/plenary.nvim")

use({
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    require("user.plugins.null-ls")
  end,
})

use({
  "VonHeikemen/lsp-zero.nvim",
  requires = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    require("user.plugins.lsp-zero")
  end,
})

use({
  "kyazdani42/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("user.plugins.nvim-tree")
  end,
})

use({
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
  },
  config = function()
    require("user.plugins.telescope")
  end,
})

use({
  "tpope/vim-fugitive",
  requires = "tpope/vim-rhubarb",
  cmd = "G",
})

use({
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  requires = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    require("user.plugins.treesitter")
  end,
})

use({
  "lewis6991/gitsigns.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("gitsigns").setup({
      sign_priority = 20,
      on_attach = function(bufnr)
        vim.keymap.set("n", "]h", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, buffer = bufnr })
        vim.keymap.set("n", "[h", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, buffer = bufnr })
      end,
    })
  end,
})

use({
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight-night")
  end,
})

use({
  "github/copilot.vim",
  config = function()
    require("user.plugins.copilot")
  end,
})

-- extended editor functionality
use({ "mhinz/vim-grepper", cmd = "GrepperRg" })

-- nice to have
use({
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require("lualine").setup({ options = { theme = "tokyonight" } })
  end,
})

-- Automatically install plugins on first run
if packer_bootstrap then
  require("packer").sync()
end

-- Automatically regenerate compiled loader file on save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
