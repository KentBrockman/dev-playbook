" Original
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set number
set wrap

nmap <Space> :

call plug#begin('~/.vim/plugged')
" Fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

" colorscheme
Plug 'Th3Whit3Wolf/one-nvim'
call plug#end()

" use true colors
set termguicolors
colorscheme one-nvim
set background=dark

set tabstop=4
