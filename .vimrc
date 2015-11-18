set nocompatible
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" TMUX Navigator
Bundle 'christoomey/vim-tmux-navigator'

" filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'

" Python syntax check
Plugin 'vim-scripts/Pydiction'

" XML/HTML
Plugin 'sukima/xmledit'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()


filetype plugin indent on                                                                                                                                                                                            
let g:SimpylFold_docstring_preview = 1 

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

set ruler laststatus=2 number title hlsearch

set cursorline
set smartindent                                                                                                                                                                                              
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
"hi String ctermfg=140
"hi CursorLine ctermbg=235
"hi CursorLine guibg=#D3D3D3 cterm=none

let g:solarized_termtrans = 1 

colorscheme solarized

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
   
" ***************************                                               
" * pydiction configuration *
" ***************************
let g:pydiction_location = '/home/miko/.vim/bundle/Pydiction/complete-dict'                                                                                                                                          

