set number
syntax on
filetype on 
set nocompatible              " be iMproved, required
set laststatus=2
colorscheme molokai
let g:molokai_original = 1
let g:airline_powerline_fonts=1

" set the runtime path to include Vundle and initialize

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-rails'
Plugin 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
