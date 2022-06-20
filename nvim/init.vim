scriptencoding utf-8
filetype plugin on
set termguicolors

call plug#begin()
" tools
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'

" lsp/completion
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'

" appearance
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

set number
set cursorline
set relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:indentLine_char = '|'
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set noshowmode

let g:lightline = {
    \ 'colorscheme': 'nord',
\}

colo nord

hi LspDiagnosticsDefaultError guifg=#fb4934
hi LspDiagnosticsDefaultWarning guifg=#fabd2f
hi LspDiagnosticsDefaultInformation guifg=#f9f5d7
hi LspDiagnosticsDefaultHint guifg=#928374
hi LspDiagnosticsUnderlineError guifg=#fb4934 gui=undercurl
hi LspDiagnosticsUnderlineWarning guifg=#fabd2f gui=undercurl
hi LspDiagnosticsUnderlineInformation guifg=#f9f5d7 gui=undercurl
hi LspDiagnosticsUnderlineHint guifg=#928374 gui=undercurl
hi Error guibg=#2e3440

autocmd BufEnter *.c,*.h set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.cpp,*.hpp set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.html set tabstop=2 shiftwidth=2 expandtab
autocmd BufEnter *.go set tabstop=8 shiftwidth=8 noexpandtab

nnoremap <C-p> <cmd>Telescope find_files<cr>

nnoremap <C-K> :tabprev<CR>
nnoremap <C-J> :tabnext<CR>
nnoremap tn :tabnew<CR>

nnoremap gs :Git status<CR>

nnoremap <C-l> :noh<CR>

lua << EOF
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
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

local lspkind = require('lspkind')
local cmp = require('cmp')
cmp.setup {
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },

        ['<Tab>'] = function(fallback)
            if not cmp.select_next_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,

        ['<S-Tab>'] = function(fallback)
            if not cmp.select_prev_item() then
                if vim.bo.buftype ~= 'prompt' and has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer   = "[buf]",
                nvim_lsp = "[LSP]",
                path     = "[path]",
            },
         },
      },

    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer" , keyword_length = 5},
    },
    experimental = {
        ghost_text = true
    }
}
EOF
