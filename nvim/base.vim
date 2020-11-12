set encoding=utf-8
syntax enable
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" Keep selection when move block of text
vnoremap < <gv
vnoremap > >gv

let mapleader = ","

" SEARCHING
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" LOOK & FEEL
colorscheme railscasts
