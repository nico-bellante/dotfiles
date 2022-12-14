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

vim.keymap.set("n", "<C-n>", ":NvimTreeFindFileToggle<CR>")
