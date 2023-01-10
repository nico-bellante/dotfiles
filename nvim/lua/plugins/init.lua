-- essentials
return {
  "nvim-lua/plenary.nvim",

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitsigns").setup({
        sign_priority = 20,
        on_attach = function(bufnr)
          vim.keymap.set("n", "]h", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, buffer = bufnr })
          vim.keymap.set("n", "[h", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, buffer = bufnr })
        end,
      })
    end,
  },

  {
    "folke/tokyonight.nvim",
    config = function() vim.cmd("colorscheme tokyonight-night") end,
  },

  -- extended editor functionality
  { "mhinz/vim-grepper", cmd = "GrepperRg" },

  -- nice to have
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function() require("lualine").setup({ options = { theme = "tokyonight" } }) end,
  },

  { "mbbill/undotree", config = function() vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) end },
}
