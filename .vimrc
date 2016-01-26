set spell spelllang=en_us

augroup reload_vimrc " {
    autocmd!
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

let mapleader = ","

vnoremap <Leader>s :sort<cr>

" Keep selection when move block of text...
vnoremap < <gv 
vnoremap > >gv

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
Plugin 'rking/ag.vim'

" auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'

" Snippets
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Python syntax check
Plugin 'vim-scripts/Pydiction'

Plugin 'alfredodeza/coveragepy.vim'

" XML/HTML
Plugin 'sukima/xmledit'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

Plugin 'powerline/powerline'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()

execute pathogen#infect()

filetype plugin indent on                                                                                                                                                                                            
let g:SimpylFold_docstring_preview = 1 

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0


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

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

let g:pymode_virtualenv = 1

function! s:StringifyAsJavaString() 
    execute 's/"/\\\"/g'
endfunction

command! MakeString :call s:StringifyAsJavaString()

command! FormatXml :execute "%!xmllint --format -"

nnoremap <leader>sp :normal! mm[s1z=`m<cr>

nnoremap m1 :normal! kmmjdd{p`m<cr>
nnoremap <leader>f :FormatXml<cr>
