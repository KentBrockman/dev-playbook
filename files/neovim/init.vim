set number
set wrap
set nohlsearch

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

" configurations for LSP client
Plug 'neovim/nvim-lspconfig'

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

" set up external providers
" python - excepts pyenv installed cause i tend to use that. should be smarter
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

" ruby - not disabled
" `gem info --installed neovim` should return true

" node - not disabled
" `npm -g ls | grep neovim` should return true

" disable perl
let g:loaded_perl_provider = 0

lua << EOF

------------------
-- START ---------
------------------
-- The following taken from nvim-lspconfig's Suggested Configuration Sat Nov 26 08:35:41 PM MST 2022
-- https://github.com/neovim/nvim-lspconfig#suggested-configuration

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
------------------
-- END -----------
------------------

-- set up LSP servers
-- `:h lspconfig-all` to see more language servers

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- https://github.com/microsoft/pyright
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- https://github.com/typescript-language-server/typescript-language-server
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- https://github.com/ansible/ansible-language-server
require('lspconfig')['ansiblels'].setup{}
EOF
