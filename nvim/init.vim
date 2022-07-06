set termguicolors
set updatetime=100

lua <<EOF
require('loader')
EOF

set fillchars=eob:\ 
set cmdheight=1
set laststatus=3
set noshowmode
set hidden

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
nnoremap <C-p> <cmd>Telescope find_files<cr>

" Git
nnoremap <leader>g <cmd>LazyGit<CR>

" folding
au BufEnter * normal zR
nnoremap <CR> za

" cursor history
nnoremap H <C-o>
nnoremap L <C-i>

" tabs
nnoremap bn <cmd>BufferLineCycleNext<CR>
nnoremap bp <cmd>BufferLineCyclePrev<CR>
nnoremap <C-J> <cmd>tabnext<CR>
nnoremap <C-K> <cmd>tabprev<CR>
nnoremap tt <cmd>tabnew<CR>
nnoremap <leader>b <cmd>BufferLinePick<CR>

" clear highlight
nnoremap <C-l> <cmd>noh<CR>

hi Comment gui=italic
hi BufferLineFill guibg=#191c23
