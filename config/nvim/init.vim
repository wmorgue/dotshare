call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'keith/swift.vim'

call plug#end()

""" Coloring
color dracula
let g:airline_theme='deus'

syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set encoding=utf-8
set number
set title

