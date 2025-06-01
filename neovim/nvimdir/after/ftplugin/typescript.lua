if not vim.g.loaded_my_vimrc then
  return
end
if vim.g.loaded_my_typescript_lua then
  return
end
vim.g.loaded_my_typescript_lua = true

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

--local on_attach = function(client, bufnr)
--  -- format on save
--  if client.server_capabilities.documentFormattingProvider then
--    vim.api.nvim_create_autocmd("BufWritePre", {
--      group = vim.api.nvim_create_augroup("Format", { clear = true }),
--      buffer = bufnr,
--      callback = function() vim.lsp.buf.formatting_seq_sync() end
--    })
--  end
--end

-- TypeScript
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  --on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
