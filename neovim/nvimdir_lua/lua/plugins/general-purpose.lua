-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
  { 
    "tyru/open-browser.vim",
    lazy = true
  },
  { "tpope/vim-fugitive" }, 
  { "airblade/vim-gitgutter" }, 
  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active=true
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
}
