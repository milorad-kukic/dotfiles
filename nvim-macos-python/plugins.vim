call plug#begin('~/.config/nvim/plugged')

" Common navigation of tmux and nvim windows
Plug 'christoomey/vim-tmux-navigator'

" FileSystem
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Look & Feel
Plug 'itchyny/lightline.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'ryanoasis/vim-devicons'
Plug 'her/synicons.vim'

" Auto-complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Utility
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

" GIT
Plug 'tpope/vim-fugitive'

call plug#end()
