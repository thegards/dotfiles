-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
  { 
    "tyru/open-browser.vim",
    lazy = true
  },
  { "tpope/vim-fugitive" }, 
  { "airblade/vim-gitgutter" }, 
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      require("rainbow-delimiters.setup").setup{
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      sync_install = false,
      ensure_installed = {
        "vimdoc",
        "lua",
        "clojure",
        "bash",
        "json",
        "markdown",
        "sql",
        "yaml",
        "scala"
      }
    },
  },
  { "tpope/vim-surround" }, 
  {
    "thegards/vim-dispatch",
    branch = "wip/start-on-split-tmux-pane",
    init = function()
      vim.g.dispatch_no_maps = 1
    end,
  }, 
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  }, 
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
