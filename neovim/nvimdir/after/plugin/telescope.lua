if not vim.g.loaded_my_vimrc then
  return
end
if vim.g.loaded_my_telescope_lua then
  return
end
vim.g.loaded_my_telescope_lua = true

require"my_utilities"

vim.keymap.set("n", as_search_cmd("/"), ":Telescope find_files<CR>")
vim.keymap.set("n", as_search_cmd("c"), ":Telescope live_grep<CR>")
vim.keymap.set("n", as_search_cmd("b"), ":Telescope buffers<CR>")
vim.keymap.set("n", as_search_cmd("h"), ":Telescope help_tags<CR>")
