-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel" },
    lazy = true,
    init = function()
      vim.g["conjure#mapping#doc_word"] = "K"
      vim.g["conjure#log#botright"] = true
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
    end,
    dependencies = {
      {
        "PaterJason/cmp-conjure",
        ft = "clojure",
        config = function()
          local cmp = require("cmp")
          local config = cmp.get_config()
          table.insert(config.sources, {
            name = "buffer",
            option = {
              sources = {
                { name = "conjure" },
              },
            },
          })
          cmp.setup(config)
        end
      }
    }
  },
  { "guns/vim-sexp", ft = "clojure" },
  { "tpope/vim-sexp-mappings-for-regular-people", ft = "clojure" },
  { "clojure-vim/vim-jack-in", ft = "clojure" },
}
