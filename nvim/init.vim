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
Plug 'lewis6991/gitsigns.nvim'
call plug#end()


lua <<EOF
require('lsp')
require('lsp-ui')
require('cmp-config')
require('lualine-config')
require('telescope-config')
require("nvim-autopairs").setup()
require'colorizer'.setup()
require('gitsigns').setup()

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
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:mapleader = ' '

colorscheme nord

hi! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4c566a
hi! CmpItemAbbrMatch guibg=NONE guifg=#8FBCBB
hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#8FBCBB
hi! CmpItemKindVariable guibg=NONE guifg=#D8DEE9
hi! CmpItemKindInterface guibg=NONE guifg=#D8DEE9
hi! CmpItemKindText guibg=NONE guifg=#D8DEE9
hi! CmpItemKindFunction guibg=NONE guifg=#88C0D0
hi! CmpItemKindMethod guibg=NONE guifg=#88C0D0
hi! CmpItemKindClass guibg=NONE guifg=#8FBCBB
hi! CmpItemKindModule guibg=NONE guifg=#8FBCBB
hi! CmpItemKindKeyword guibg=NONE guifg=#81A1C1
hi! CmpItemKindProperty guibg=NONE guifg=#81A1C1
hi! CmpItemKindUnit guibg=NONE guifg=#81A1C1

nnoremap <leader><leader> <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>m <cmd>Telescope man_pages<cr>
nnoremap R <cmd>Telescope lsp_references<cr>

nnoremap <C-K> <cmd>tabprevious<CR>
nnoremap <C-J> <cmd>tabnext<CR>
nnoremap tt <cmd>tabnew<CR>

nnoremap gs <cmd>Git status<CR>

nnoremap <C-l> <cmd>noh<CR>
