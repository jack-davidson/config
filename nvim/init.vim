scriptencoding utf-8
filetype plugin on
set termguicolors

call plug#begin()
" tools
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-fugitive'

" lsp/completion
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'

" nvim-cmp sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'buoto/gotests-vim'
Plug 'fatih/vim-go'

" appearance
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()


lua <<EOF
require('lsp')
require('lualine-config')
require('telescope-config')
require'colorizer'.setup()

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

set number
set cursorline
set relativenumber
set noshowmode
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
let g:indentLine_char = '|'
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:mapleader = ' '

colorscheme nord

hi LspDiagnosticsDefaultError guifg=#fb4934
hi LspDiagnosticsDefaultWarning guifg=#fabd2f
hi LspDiagnosticsDefaultInformation guifg=#f9f5d7
hi LspDiagnosticsDefaultHint guifg=#928374
hi LspDiagnosticsUnderlineError guifg=#fb4934 gui=undercurl
hi LspDiagnosticsUnderlineWarning guifg=#fabd2f gui=undercurl
hi LspDiagnosticsUnderlineInformation guifg=#f9f5d7 gui=undercurl
hi LspDiagnosticsUnderlineHint guifg=#928374 gui=undercurl
hi Error guibg=#2e3440

highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4c566a
highlight! CmpItemAbbrMatch guibg=NONE guifg=#8FBCBB
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#8FBCBB
highlight! CmpItemKindVariable guibg=NONE guifg=#D8DEE9
highlight! CmpItemKindInterface guibg=NONE guifg=#D8DEE9
highlight! CmpItemKindText guibg=NONE guifg=#D8DEE9
highlight! CmpItemKindFunction guibg=NONE guifg=#88C0D0
highlight! CmpItemKindMethod guibg=NONE guifg=#88C0D0
highlight! CmpItemKindClass guibg=NONE guifg=#8FBCBB
highlight! CmpItemKindModule guibg=NONE guifg=#8FBCBB
highlight! CmpItemKindKeyword guibg=NONE guifg=#81A1C1
highlight! CmpItemKindProperty guibg=NONE guifg=#81A1C1
highlight! CmpItemKindUnit guibg=NONE guifg=#81A1C1

autocmd BufEnter *.c,*.h set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.cpp,*.hpp set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.html set tabstop=2 shiftwidth=2 expandtab
autocmd BufEnter *.go set tabstop=8 shiftwidth=8 noexpandtab

nnoremap <leader><leader> <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>m <cmd>Telescope man_pages<cr>
nnoremap R <cmd>Telescope lsp_references<cr>

nnoremap <C-K> <cmd>tabprevious<CR>
nnoremap <C-J> <cmd>tabnext<CR>
nnoremap tt <cmd>tabnew<CR>

nnoremap gs <cmd>Git status<CR>

nnoremap <C-l> <cmd>noh<CR>
