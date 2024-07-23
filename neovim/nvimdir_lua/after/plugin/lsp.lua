if not vim.g.loaded_my_vimrc then
  return
end

require"command_utilities"

if vim.g.loaded_my_lsp_lua then
  return
end
vim.g.loaded_my_lsp_lua = true

vim.keymap.set("n", "K",                   function() vim.lsp.buf.hover() end,             { desc = "Show documentation" })
vim.keymap.set("n", "<c-]>",               function() vim.lsp.buf.definition() end,        { desc = "Go to definition" })
vim.keymap.set("n", as_cmd("D"),           function() vim.lsp.buf.declaration() end,       { desc = "Go to declaration" })
vim.keymap.set("n", as_cmd("t"),           function() vim.lsp.buf.type_definition() end,   { desc = "Go to type definition" })
vim.keymap.set("n", as_cmd("r"),           function() vim.lsp.buf.references() end,        { desc = "Show symbol references" })
vim.keymap.set("n", as_cmd("0"),           function() vim.lsp.buf.document_symbol() end,   { desc = "Go to document symbol" })
vim.keymap.set("n", as_cmd("W"),           function() vim.lsp.buf.workspace_symbol() end,  { desc = "Go to workspace symbol" })
vim.keymap.set("n", as_cmd("A"),           function() vim.lsp.buf.code_action() end,       { desc = "Execute code action" })
vim.keymap.set("x", as_cmd("A"),           function() vim.lsp.buf.range_code_action() end, { desc = "Execute code action for selected range" })
vim.keymap.set("n", as_refactor_cmd("rs"), function() vim.lsp.buf.rename() end,            { desc = "Rename symbol under cursor" })
