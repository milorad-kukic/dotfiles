"
" Author: Milorad Kukic <kukic.milorad@gmail.com>
"

" 1. PREAMBLE ------------------------------------------------------------ {{{

" Reload .vimrc when it is saved
augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

let mapleader = ","

" }}}
" 2. BASIC SETTINGS ------------------------------------------------------ {{{
filetype plugin indent on
syntax on
set encoding=utf-8
set nocompatible
set autoindent

set tabstop=4
set shiftwidth=4
set expandtab

" Keep selection when move block of text.
vnoremap < <gv
vnoremap > >gv

" Visual autocomplete for command menu
set wildmenu

set shell=/bin/bash

" }}}
" 3. SEARCHING ----------------------------------------------------------- {{{
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
" }}}
" 4. FOLDING ------------------------------------------------------------- {{{
set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker keywordprg=:help
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" 5. PLUGINS ------------------------------------------------------------- {{{
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Christoomey/vim-tmux-navigator'

" File System
Plugin 'Scrooloose/nerdtree'
Plugin 'Kien/ctrlp.vim'

" Status bar styling
Plugin 'itchyny/lightline.vim'

" Snippets
Plugin 'sirVer/ultisnips'
Plugin 'Honza/vim-snippets'

" Sparkup for generating HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'alvan/vim-closetag'
Plugin 'othree/html5.vim'

" CSS
Plugin 'ap/vim-css-color'

" Tagbar
Plugin 'majutsushi/tagbar'

" JavaScript
Plugin 'Pangloss/vim-javascript'
Plugin 'burnettk/vim-angular'

Plugin 'vim-syntastic/syntastic'

" Auto Completition
Plugin 'Valloric/YouCompleteMe'
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'ternjs/tern_for_vim'

" Cool utility stuff
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'

" Code Formatting
Plugin 'maksimr/vim-jsbeautify'

" Theme
Plugin 'jpo/vim-railscasts-theme'

call vundle#end()

execute pathogen#infect()
" }}}
" 6. PLUGINS CONFIGURATION ----------------------------------------------- {{{
map <C-n> : NERDTreeToggle<CR>

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments = 1
let g:ycm_server_python_interpreter='/usr/bin/python'

let g:ycm_semantic_triggers = {
    \   'css': [ 're!^\s{4}', 're!:\s+' ],
    \   'javascript,js': ['.'],
    \ }

autocmd FileType javascript setlocal omnifunc=tern#Complete

" Tagbar
nnoremap <leader>t :TagbarToggle<cr>

" Code Beautifier
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

let g:used_javascript_libs = 'angularjs,angularui,angularui-router,jasmine'
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']

autocmd FileType javascript UltiSnipsAddFiletypes javascript-jasmine

if filereadable( expand("$HOME/.vim/bundle/vim-railscasts-theme/colors/railscasts.vim") )
    colorscheme railscasts
endif

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" }}}
