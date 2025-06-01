if vim.g.command_utilities_loaded then
  return
end
vim.g.command_utitities_loaded = true

local global_search_prefix = '<leader>/'
if vim.g.global_search_prefix then
  global_search_prefix = vim.g.global_search_prefix
end

function as_search_cmd(command)
  return global_search_prefix .. command
end

local command_prefix = '<localleader>g'
if vim.g.clojure_bindings_prefix then
  command_prefix = vim.g.lsp_bindings_prefix
end

function as_cmd(command)
  return command_prefix .. command
end

local refactor_command_prefix = '<localleader>r'
if vim.g.clojure_bindings_prefix then
  refactor_command_prefix = vim.g.refactors_prefix
end

function as_refactor_cmd(command)
  return refactor_command_prefix .. command
end
