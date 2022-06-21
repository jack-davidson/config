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

autocmd BufEnter *.c,*.h set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.cpp,*.hpp set tabstop=8 shiftwidth=8 noexpandtab
autocmd BufEnter *.html set tabstop=2 shiftwidth=2 expandtab
autocmd BufEnter *.go set tabstop=8 shiftwidth=8 noexpandtab

nnoremap <leader><leader> <cmd>Telescope git_files<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>m <cmd>Telescope man_pages<cr>

nnoremap <C-K> :tabprevious<CR>
nnoremap <C-J> :tabnext<CR>
nnoremap tt :tabnew<CR>

nnoremap gs :Git status<CR>

nnoremap <C-l> :noh<CR>
