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

" highlite compatible colorscheme
Plug 'Th3Whit3Wolf/one-nvim'

" Text objects and motions for surroundings
Plug 'tpope/vim-surround'
" Verb for commenting lines
Plug 'tpope/vim-commentary'

" Pair up brackets as you type
Plug 'jiangmiao/auto-pairs'

" Text objects for indentation
Plug 'michaeljsmith/vim-indent-object'

Plug 'sheerun/vim-polyglot'
" requires nvim 0.7.0
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" use true colors
set termguicolors
colorscheme one-nvim
set background=dark

set tabstop=4

" default netrw to tree style
let g:netrw_liststyle=3

" ChangeBackground changes the background mode based gnome appearance
" setting. We also refresh the statusline colors to reflect the new mode.
function! ChangeBackground()
  if system('dconf read /org/gnome/desktop/interface/color-scheme') =~ 'dark'
    set background=dark
  else
    set background=light
  endif
endfunction

" call on startup to set the right background based on current system theme
call ChangeBackground()
