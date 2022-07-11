" Original
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set number
set wrap

" compatibility with SpaceVim
" set runtimepath^=~/.vim_back runtimepath+=~/.vim_back/after
" let &packpath = &runtimepath
" source ~/.vimrc_back
" set fzf
" set background as function of appearnce (light vs dark)
set background=light

nmap <Space> :

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }   " Fuzzy File Finding
Plug 'junegunn/fzf.vim'
call plug#end()
