set termguicolors
set updatetime=100

lua require('plugins')

set fillchars=eob:\ 
set cmdheight=1
set laststatus=3
set noshowmode
set hidden
set conceallevel=2

set number
set relativenumber

set cursorline
set mouse=a

set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab

set incsearch
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

colorscheme nord

let g:mapleader = ' '

nnoremap <leader>s <cmd>SymbolsOutline<CR>

" Telescope
nnoremap <leader><leader> <cmd>Telescope git_files<CR>

" Git
nnoremap <leader>g <cmd>LazyGit<CR>

nnoremap <C-n> <cmd>NvimTreeToggle<CR>

" cursor history
nnoremap H <C-o>
nnoremap L <C-i>

" tabs
nnoremap <C-J> <cmd>BufferLineCycleNext<CR>
nnoremap <C-K> <cmd>BufferLineCyclePrev<CR>
nnoremap tt <cmd>tabnew<CR>

" clear highlight
nnoremap <C-l> <cmd>noh<CR>

hi Comment gui=italic
hi BufferLineFill guibg=#191c23
