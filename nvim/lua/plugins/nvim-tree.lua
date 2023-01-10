return {
  "kyazdani42/nvim-tree.lua",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    require("nvim-tree").setup({
      disable_netrw = false,
      git = {
        ignore = false,
      },
      renderer = {
        highlight_opened_files = "1",
        group_empty = true,
        icons = {
          show = {
            folder_arrow = false,
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      view = {
        side = "right",
      },
    })
  end,
}
