scriptencoding utf-8
filetype plugin on
set termguicolors

call plug#begin()
" tools
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'windwp/nvim-autopairs'

" lsp/completion
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" nvim-cmp sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" language
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'norcalli/nvim-colorizer.lua'

" appearance
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
call plug#end()

lua require('lsp')
lua require('telescope-config')
lua require'colorizer'.setup()

set number
set cursorline
set relativenumber
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:indentLine_char = '|'
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set noshowmode
let g:mapleader = ' '

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

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4c566a
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#8FBCBB
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#8FBCBB
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#D8DEE9
highlight! CmpItemKindInterface guibg=NONE guifg=#D8DEE9
highlight! CmpItemKindText guibg=NONE guifg=#D8DEE9
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#88C0D0
highlight! CmpItemKindMethod guibg=NONE guifg=#88C0D0
" yellow
highlight! CmpItemKindClass guibg=NONE guifg=#8FBCBB
highlight! CmpItemKindModule guibg=NONE guifg=#8FBCBB
" front
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
