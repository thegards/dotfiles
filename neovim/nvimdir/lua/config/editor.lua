-- vim:ts=2:sts=2:sw=2:et:nowrap

vim.o.belloff = "all"

-- Use all utf-8 for encoding a file.
vim.opt.fileencodings = {"utf-8", "utf-16le", "utf-16be"}
vim.o.encoding = "utf-8"
--vim.cmd([[scriptencoding utf-8]])

vim.o.textwidth = 120
if vim.o.diff
then
  vim.o.winwidth = 5
  vim.opt.diffopt:append("iwhite")
else
  vim.o.foldmethod = "syntax"
  vim.o.foldlevelstart = 99
  vim.o.winwidth = 121
  vim.o.colorcolumn = "+1"
end
vim.opt.scrollopt:append("hor")

--" Default indent style
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2

--" UTF-8 Visual aids setup.
vim.o.showbreak = ">\\"
vim.opt.fillchars = {
  vert = "|",
  stl = "-"
}
vim.opt.list = false
vim.opt.listchars = {
  tab = "|-",
  trail = "~",
  eol = "$",
  space = "·"
}
vim.keymap.set(
  "n",
  "<F9>",
  function()
    vim.o.list = not vim.o.list
  end,
  { desc = "Toggle listchars" }
)

vim.o.wrap = false
vim.opt.backspace = { "indent", "eol", "start" }
vim.o.ignorecase = true
vim.o.virtualedit = "onemore"
vim.o.modelines = 5

-- Don't format text automatically using textwidth
vim.opt.formatoptions:remove("t")

-- Highlight current cursor line
vim.o.cursorline = true
vim.o.hlsearch = false

vim.o.scrolloff = 999

-- Line number display Setup ===================================================
vim.o.signcolumn = 'yes'
vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 5

vim.api.nvim_create_autocmd(
  {"FocusLost", "InsertEnter"},
  {
    pattern = "*",
    callback = function()
      vim.o.relativenumber = false
      vim.o.number = true
    end
  }
)

vim.api.nvim_create_autocmd(
  {"FocusGained", "InsertLeave"},
  {
    pattern = "*",
    callback = function()
      vim.o.relativenumber = true
      vim.o.number = true
    end
  }
)
