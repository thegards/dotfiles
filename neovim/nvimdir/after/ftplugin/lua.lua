if not vim.g.loaded_my_vimrc then
  return
end
if vim.g.loaded_my_lua_lua then
  return
end
vim.g.loaded_my_lua_lua = true

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}
