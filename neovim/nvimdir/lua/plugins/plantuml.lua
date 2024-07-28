-- vim:ts=2:sts=2:sw=2:et:nowrap

return {
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
}
