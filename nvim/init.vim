set termguicolors

lua require('plugins')

for f in split(glob('~/.config/nvim/vim/*'), '\n')
    exe 'source' f
endfor

set number
set updatetime=100
set cursorline
set relativenumber
set noshowmode
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set incsearch
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:mapleader = ' '

colorscheme nord

nnoremap <leader><leader> <cmd>Telescope git_files<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap R <cmd>Telescope lsp_references<cr>

nnoremap gs <cmd>Git status<CR>
nnoremap ga <cmd>Git add %<CR>
nnoremap gc <cmd>Git commit -m input()<CR>
nnoremap gp <cmd>Git push<CR>

nnoremap <leader>g <cmd>LazyGit<CR>

nnoremap H <C-o>
nnoremap L <C-i>

nnoremap <C-K> <cmd>tabprevious<CR>
nnoremap <C-J> <cmd>tabnext<CR>
nnoremap tt <cmd>tabnew<CR>

nnoremap <C-l> <cmd>noh<CR>
