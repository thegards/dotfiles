" vim:ts=2:sts=2:sw=2:et:nowrap

syntax on
filetype plugin indent on

"== Plugin Setup ===============================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Plugin management
Plug 'junegunn/vim-plug'

" LSP
"Plug 'm00qek/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

" Visuals
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'stevearc/dressing.nvim'

" General-purpose
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'

" vim customization + features
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'PaterJason/cmp-conjure'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim',              { 'tag': '0.1.x' }

" clojure support
Plug 'Olical/conjure',                             { 'for': 'clojure' }
Plug 'guns/vim-sexp',                              { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'clojure-vim/vim-jack-in',                    { 'for': 'clojure' }

" scala support
Plug 'derekwyatt/vim-scala',                       { 'for': 'scala' }
Plug 'scalameta/nvim-metals',                      { 'for': 'scala' }

" plantuml support
Plug 'tyru/open-browser.vim',                      { 'for': 'plantuml' }
Plug 'aklt/plantuml-syntax',                       { 'for': 'plantuml' }
Plug 'weirongxu/plantuml-previewer.vim',           { 'for': 'plantuml' }

call plug#end()

filetype plugin on

let g:airline_theme='nord'
let g:airline_powerline_fonts=1
let g:nord_bold_vertical_split_line=1

let g:rainbow_active = 1

let g:mapleader=' '
let g:maplocalleader=','

let g:conjure#mapping#doc_word = "K"
let g:conjure#log#botright=v:true
let g:conjure#client#clojure#nrepl#connection#auto_repl#enabled=v:false

let g:loaded_my_vimrc=v:true

"== General Setup ==============================================================

" Disable annoying bell sounds
set belloff=all

" Disable BCE to make colorschemes work on tmux
set t_ut=
set t_Co=256
"set termguicolors
colorscheme nord

" Use all utf-8 for encoding a file.
scriptencoding utf-8
set fileencodings=utf-8,utf-16le,utf-16be
set encoding=utf-8

set textwidth=120
if &diff
  set winwidth=5
  set diffopt+=iwhite
else
  set foldmethod=syntax
  set foldlevelstart=99
  set winwidth=121
  set colorcolumn=+1
endif

set scrollopt+=hor

" Default indent style
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" UTF-8 Visual aids setup.
set showbreak=>\ 
set fillchars=vert:│,stl:-
set nolist
set listchars=tab:\|-,trail:~,eol:$,space:·
nmap <silent> <F9> :set list!<CR>

set nowrap
set fo-=t " Don't format text automatically using textwidth
set bs=indent,eol,start
set ignorecase
set virtualedit=onemore
set modelines=5

" Highlight current cursor line
set cul
set nohlsearch

set scrolloff=999

"= Line number display Setup ===================================================

" default to relative line numbers
set signcolumn=yes
set relativenumber
set number
set numberwidth=5

" show absolute line numbers when focus is lost
au FocusLost *   :set nu | set nornu
au FocusGained * :set rnu | set nu

" show absolute line numbers when in insert mode
au InsertEnter * :set nu | set nornu
au InsertLeave * :set rnu | set nu

nmap     <silent> <localleader>i"gu i=system("uuidgen \| tr -d '\n' \| tr '[:upper:]' '[:lower:]'")<CR><Esc>
nmap     <silent> <localleader>igu  i"=system("uuidgen \| tr -d '\n' \| tr '[:upper:]' '[:lower:]'")<CR>"<Esc>
nmap     <silent> <localleader>ci"u ci"=system("uuidgen \| tr -d '\n' \| tr '[:upper:]' '[:lower:]'")<CR><Esc>

nnoremap <silent> <F8>              :RainbowToggle<CR>
