-- vim:ts=2:sts=2:sw=2:et:nowrap

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader=" "
vim.g.maplocalleader=","

require("lazy").setup({
  spec = {
    -- visuals
    {
      "arcticicestudio/nord-vim",
      lazy = false,
      priority = 99999,
      config = function()
        vim.cmd([[colorscheme nord]])
      end,
    },
    {
      "vim-airline/vim-airline",
      init = function()
        vim.g.airline_theme='nord'
        vim.g.airline_powerline_fonts=1
      end},
    {
      "vim-airline/vim-airline-themes",
      dependencies = "vim-airline/vim-airline"
    },
    {
      "stevearc/dressing.nvim",
      event = "VeryLazy",
    },
    
    -- general purpose
    { 
      "tyru/open-browser.vim",
      lazy = true
    },
    { "tpope/vim-fugitive" }, 
    { "airblade/vim-gitgutter" }, 
    {
      "luochen1990/rainbow",
      init = function()
        vim.g.rainbow_active = 1
      end,
    }, 
    { "tpope/vim-surround" }, 
    { "tpope/vim-dispatch" }, 
    {
      "nvim-lua/plenary.nvim",
      lazy = true,
    }, 
    {
      "nvim-telescope/telescope.nvim",
      branch = "0.1.x",
      dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- LSP
    { "neovim/nvim-lspconfig" }, 
    { "hrsh7th/cmp-nvim-lsp" }, 
    { "hrsh7th/cmp-buffer" }, 
    { "hrsh7th/cmp-path" }, 
    { "hrsh7th/cmp-cmdline" }, 
    { "hrsh7th/nvim-cmp" }, 
    { "hrsh7th/cmp-vsnip" }, 
    { "hrsh7th/vim-vsnip" }, 

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
    
    { "derekwyatt/vim-scala", ft = "scala" },
    { "scalameta/nvim-metals", ft = "scala" },

    { 
      "aklt/plantuml-syntax",
      ft = "plantuml"
    },
    { 
      "weirongxu/plantuml-previewer.vim",
      ft = "plantuml",
      dependencies = {
        "tyru/open-browser.vim",
        "aklt/plantuml-syntax",
      }
    },

  },
  install = { colorscheme = { "nord" } },
  checker = { enabled = true },
})
