if not vim.g.loaded_my_vimrc then
  return
end
if vim.g.loaded_my_clojure_lua then
  return
end
vim.g.loaded_my_clojure_lua = true

require"command_utilities"

-- execute an lsp command at given position allowing extra arguments
function execute_at(command_name, file_uri, cursor, ...)
  local row, col = unpack(cursor)
  vim.lsp.buf.execute_command{
    command=command_name,
    arguments={file_uri, row - 1, col, ...}
  }
end

-- delegate command execution as a callback function receiving user input
function execute_with_input(command_name, file_uri, cursor)
  return function(user_input)
    execute_at(command_name, file_uri, cursor, user_input)
  end
end

-- capture buffer location before running lsp command,
-- to enable async execution when user input is required
function with_current_position(runnable)
  return function()
    local file_uri = 'file://' .. vim.fn.expand('%:p')
    local cursor = vim.api.nvim_win_get_cursor(0)
    runnable(file_uri, cursor)
  end
end

-- create a callback that immediately executes an lsp command
function run_immediately(command_name, ...)
  local extra_args = {...}
  return with_current_position(function(file_uri, cursor)
    execute_at(command_name, file_uri, cursor, unpack(extra_args))
  end)
end

-- create a callback that reads user input and feeds to an lsp command
function run_with_input(command_name, opts)
  return with_current_position(function(file_uri, cursor)
    vim.ui.input(opts, execute_with_input(command_name, file_uri, cursor))
  end)
end

-- create a callback that prompts user to select data from a list
-- feeds the selection to an lsp command
function run_with_select(command_name, opts, select_options)
  return with_current_position(function(file_uri, cursor)
    vim.ui.select(select_options, opts, execute_with_input(command_name, file_uri, cursor))
  end)
end

-- drag-param-backward          [file-uri,row,col]                             
---vim.keymap.set("n",
---  as_refactor_cmd("ab"),
---  run_immediately("drag-param-backward"),
---  { desc = "Drag param backward" })

-- drag-param-forward           [file-uri,row,col]                             
---vim.keymap.set("n",
---  as_refactor_cmd("af"),
---  run_immediately("drag-param-forward"),
---  { desc = "Drag param forward" })

-- add-missing-import           [file-uri,row,col[,name]]                      
vim.keymap.set("n",
  as_refactor_cmd("ai"),
  run_immediately("add-missing-import"),
  { desc = "Add import to namespace" })

-- add-missing-libspec          [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("am"),
  run_immediately("add-missing-libspec"),
  { desc = "Add missing require" })

-- add-require-suggestion       [file-uri,row,col,ns,alias,refer]              
vim.keymap.set("n",
  as_refactor_cmd("as"),
  run_immediately("add-require-suggestion"),
  { desc = "Add require suggestion" })

-- cycle-coll                   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("cc"),
  run_immediately("cycle-coll"),
  { desc = "Cycle collection (#{}, {}, [], ())" })

-- cycle-keyword-auto-resolve   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ck"),
  run_immediately("cycle-keyword-auto-resolve"),
  { desc = "Cycle keyword auto-resolve" })

-- clean-ns                     [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("cn"),
  run_immediately("clean-ns"),
  { desc = "Clean namespace" })

-- cycle-privacy                [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("cp"),
  run_immediately("cycle-privacy"),
  { desc = "Cycle privacy of def/defn" })

-- create-test                  [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ct"),
  run_immediately("create-test"),
  { desc = "Create test" })

-- demote-fn                    [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("df"),
  run_immediately("demote-fn"),
  { desc = "Demote fn to #()" })

-- drag-backward                [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("db"),
--  run_immediately("drag-backward"),
--  { desc = "Drag backward" })

-- drag-forward                 [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("df"),
--  run_immediately("drag-forward"),
--  { desc = "Drag forward" })

-- destructure-keys             [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("dk"),
  run_immediately("destructure-keys"),
  { desc = "Destructure keys" })

-- extract-to-def               [file-uri,row,col,name]                        
vim.keymap.set("n",
  as_refactor_cmd("ed"),
  run_with_input("extract-to-def", { prompt = "def name:" }),
  { desc = "Extract to def" })

-- extract-function             [file-uri,row,col,name]                        
vim.keymap.set("n",
  as_refactor_cmd("ef"),
  run_with_input("extract-function", { prompt = "Function name:" }),
  { desc = "Extract function" })

-- expand-let                   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("el"),
  run_immediately("expand-let"),
  { desc = "Expand let" })

-- create-function              [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("fe"),
  run_immediately("create-function"),
  { desc = "Create function from example" })

-- get-in-all                   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ga"),
  run_immediately("get-in-all"),
  { desc = "Move all expressions to get/get-in" })

-- get-in-less                  [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("gl"),
  run_immediately("get-in-less"),
  { desc = "Remove one element from get/get-in" })

-- get-in-more                  [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("gm"),
  run_immediately("get-in-more"),
  { desc = "Move another expression to get/get-in" })

-- get-in-none                  [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("gn"),
  run_immediately("get-in-none"),
  { desc = "Unwind whole get/get-in" })

-- introduce-let                [file-uri,row,col,name]                        
vim.keymap.set("n",
  as_refactor_cmd("il"),
  run_with_input("introduce-let", { prompt = "Binding name:" }),
  { desc = "Introduce let" })

-- inline-symbol                [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("is"),
  run_immediately("inline-symbol"),
  { desc = "Inline Symbol" })

-- resolve-macro-as             [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ma"),
  run_immediately("resolve-macro-as"),
  { desc = "Resolve macro as" })

-- move-form                    [file-uri,row,col,filename]                    
vim.keymap.set("n",
  as_refactor_cmd("mf"),
  run_with_input("move-form", { prompt = "Filename:" }),
  { desc = "Move form" })

-- move-to-let                  [file-uri,row,col,name]                        
vim.keymap.set("n",
  as_refactor_cmd("ml"),
  run_with_input("move-to-let", { prompt = "Binding name:" }),
  { desc = "Move expression to let" })

-- promote-fn                   [file-uri,row,col,fn-name]                     
vim.keymap.set("n",
  as_refactor_cmd("pf"),
  run_with_input("promote-fn", { prompt = "Function name:" }),
  { desc = "Promote #() to fn, or fn to defn" })

-- replace-refer-all-with-refer [file-uri,row,col,refers]                      
vim.keymap.set("n",
  as_refactor_cmd("rr"),
  run_immediately("replace-refer-all-with-refer"),
  { desc = "Replace ':refer :all' with ':refer [...]'"})

-- replace-refer-all-with-alias [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ra"),
  run_immediately("replace-refer-all-with-alias"),
  { desc = "Replace ':refer :all' with alias" })

-- restructure-keys             [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("rk"),
  run_immediately("restructure-keys"),
  { desc = "Restructure keys" })

-- change-coll                  [file-uri,row,col,"map"/"list"/"set"/"vector"] 
vim.keymap.set("n",
  as_refactor_cmd("scc"),
  run_with_select("change-coll", { prompt = "New type:" }, {"map", "list", "set", "vector"}),
  { desc = "Switch collection to {}, (), #{}, []" })

vim.keymap.set("n",
  as_refactor_cmd("scm"),
  run_immediately("change-coll", "map"),
  { desc = "Switch collection to {}" })

vim.keymap.set("n",
  as_refactor_cmd("scs"),
  run_immediately("change-coll", "set"),
  { desc = "Switch collection to #{}" })

vim.keymap.set("n",
  as_refactor_cmd("scv"),
  run_immediately("change-coll", "vector"),
  { desc = "Switch collection to []" })

vim.keymap.set("n",
  as_refactor_cmd("scl"),
  run_immediately("change-coll", "list"),
  { desc = "Switch collection to ()" })

-- sort-clauses                 [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("sl"),
  run_immediately("sort-clauses"),
  { desc = "Sort map/vector/list/set/clauses" })

-- thread-first-all             [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("tf"),
  run_immediately("thread-first-all"),
  { desc = "Thread first all" })

-- thread-first                 [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("th"),
  run_immediately("thread-first"),
  { desc = "Thread first expression" })

-- thread-last-all              [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("tl"),
  run_immediately("thread-last-all"),
  { desc = "Thread last all" })

-- thread-last                  [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("tt"),
  run_immediately("thread-last"),
  { desc = "Thread last expression" })

-- unwind-all                   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ua"),
  run_immediately("unwind-all"),
  { desc = "Unwind whole thread" })

-- unwind-thread                [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("uw"),
  run_immediately("unwind-thread"),
  { desc = "Unwind thread once" })

-- forward-slurp                [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("fs"),
--  run_immediately("forward-slurp"),
--  { desc = "Paredit: forward slurp" })

-- forward-barf                 [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("fb"),
--  run_immediately("forward-barf"),
--  { desc = "Paredit: forward barf" })

-- backward-slurp               [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("bs"),
--  run_immediately("backward-slurp"),
--  { desc = "Paredit: backward slurp" })

-- backward-barf                [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("bb"),
--  run_immediately("backward-barf"),
--  { desc = "Paredit: backward barf" })

-- raise-sexp                   [file-uri,row,col]                             
--vim.keymap.set("n",
--  as_refactor_cmd("rs"),
--  run_immediately("raise-sexp"),
--  { desc = "Paredit: Raise sexp" })

-- kill-sexp                    [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("ks"),
  run_immediately("kill-sexp"),
  { desc = "Paredit: Kill sexp" })

-- go-to-test                   [file-uri,row,col]                             
vim.keymap.set("n",
  as_refactor_cmd("gt"),
  run_immediately("go-to-test"),
  { desc = "Go to test" })

vim.keymap.set("n",
  "<localleader>`l",
  ':Lein repl<CR>',
  { desc = "Open REPL" })

vim.keymap.set("n",
  "<localleader>`d",
  ':Clj -MnREPL -m nrepl.cmdline<CR>',
  { desc = "Open REPL" })

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
lspconfig.clojure_lsp.setup{
  capabilities = capabilities
}
