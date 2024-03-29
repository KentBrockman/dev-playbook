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

" autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

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

" Taken from https://stackoverflow.com/a/6271254
" Thanks xolox!
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    " return visual selection, <Space> break across <CR>
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, " ")
endfunction

" Search visual selection in google
" Uses xdg-open so doenst work on wayland or over ssh...for now
function SearchGoogle() range
    silent execute "!xdg-open \"https://google.ca/search?q=" . s:get_visual_selection() "\" 2> /dev/null"
endfunction
command! -range SearchGoogle call g:SearchGoogle()
vnoremap gx :call SearchGoogle()<CR>

" change floating window color so it doesnt blend in with background
highlight NormalFloat guibg=Black

" set up external providers
" python - excepts pyenv installed cause i tend to use that. should be smarter
let g:python3_host_prog = '~/.pyenv/versions/neovim3/bin/python'

" ruby - not disabled
" `gem info --installed neovim` should return true

" node - not disabled
" `npm -g ls | grep neovim` should return true

" disable perl
let g:loaded_perl_provider = 0

set completeopt=menu,menuone,noselect

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


-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
-- `:h lspconfig-all` to see more language servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
