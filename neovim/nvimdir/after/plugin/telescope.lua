if not vim.g.loaded_my_vimrc then
  return
end

require"command_utilities"

if vim.g.loaded_my_telescope_lua then
  return
end
vim.g.loaded_my_telescope_lua = true

vim.keymap.set("n", as_search_cmd("/"), ":Telescope find_files<CR>", { desc = "Fuzzy find files by name using telescope" })
vim.keymap.set("n", as_search_cmd("c"), ":Telescope live_grep<CR>", { desc = "Lie grep project files using telescope" })
vim.keymap.set("n", as_search_cmd("b"), ":Telescope buffers<CR>", { desc = "Fuzzy find buffers by name using telescope" })
vim.keymap.set("n", as_search_cmd("h"), ":Telescope help_tags<CR>", { desc = "Search help tags using telescope" })
