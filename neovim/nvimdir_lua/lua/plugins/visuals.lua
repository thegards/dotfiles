-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
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
    end,
  },
  {
    "vim-airline/vim-airline-themes",
    dependencies = { "vim-airline/vim-airline" }
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
}
