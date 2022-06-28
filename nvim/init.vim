set termguicolors

lua require('plugins')

set number
set cmdheight=1
set hidden
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
set pumblend=10
set winblend=10
set mouse=a
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:mapleader = ' '

colorscheme nord

" Telescope
nnoremap <leader><leader> <cmd>Telescope git_files<CR>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap R <cmd>Telescope lsp_references<cr>

" Git
nnoremap <leader>g <cmd>LazyGit<CR>

" folding
au BufEnter * normal zR
nnoremap <CR> za

" cursor history
nnoremap H <C-o>
nnoremap L <C-i>

" tabs
nnoremap <C-J> <cmd>tabprevious<CR>
nnoremap <C-K> <cmd>tabnext<CR>
nnoremap tt <cmd>tabnew<CR>

nnoremap <C-l> <cmd>noh<CR>

hi Comment gui=italic

" LSP diagnostics window
hi NormalFloat guibg=#2E3440
hi FloatBorder guifg=#81A1C1

" nvim-cmp completion menu hl groups
hi CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#4c566a
hi CmpItemAbbrMatch guibg=NONE guifg=#8FBCBB
hi CmpItemAbbrMatchFuzzy guibg=NONE guifg=#8FBCBB
hi CmpItemKindVariable guibg=NONE guifg=#D8DEE9
hi CmpItemKindInterface guibg=NONE guifg=#D8DEE9
hi CmpItemKindText guibg=NONE guifg=#D8DEE9
hi CmpItemKindFunction guibg=NONE guifg=#88C0D0
hi CmpItemKindMethod guibg=NONE guifg=#88C0D0
hi CmpItemKindClass guibg=NONE guifg=#8FBCBB
hi CmpItemKindModule guibg=NONE guifg=#8FBCBB
hi CmpItemKindKeyword guibg=NONE guifg=#81A1C1
hi CmpItemKindProperty guibg=NONE guifg=#81A1C1
hi CmpItemKindUnit guibg=NONE guifg=#81A1C1
