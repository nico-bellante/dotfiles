local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
  "rust_analyzer",
  "pyright",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<Tab>"] = cmp.mapping(function(fallback)
    local copilot_keys = vim.fn["copilot#Accept"]()
    if cmp.visible() then
      cmp.select_next_item()
    elseif copilot_keys ~= "" and type(copilot_keys) == "string" then
      vim.fn.feedkeys(copilot_keys, "i", true)
    else
      fallback()
    end
  end, { "i", "s" }),
})

lsp.set_preferences({
  sign_icons = {},
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local disable_formatting_for = { "tsserver", "eslint", "sumneko_lua" }

for _, ls in ipairs(disable_formatting_for) do
  lsp.configure(ls, {
    on_attach = function(client, bufnr) client.server_capabilities.document_formatting = false end,
  })
end

lsp.nvim_workspace()
lsp.setup()
