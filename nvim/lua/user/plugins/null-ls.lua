require("null-ls").setup({
  sources = {
    require("null-ls").builtins.code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),
    require("null-ls").builtins.code_actions.gitsigns,
    require("null-ls").builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),
    require("null-ls").builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
    require("null-ls").builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js" })
      end,
    }),
    require("null-ls").builtins.formatting.prettierd,
    require("null-ls").builtins.formatting.stylua,
  },
})
