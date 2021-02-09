" ~/.config/nvim/init.vim

" This NeoVim configuration aims to
" be easy to maintain and highly documented.
" Configuration is only added once it is
" fully understood. Configuration is written
" in a hierarchical format.
" ex:
"
"   " Configuration Category:
"       " Configuration Title:
"           " configuration comment/documentation link
"           <configuration command>

" Initialization:
    scriptencoding utf-8
    filetype plugin on
    set termguicolors

" Plugins:
    call plug#begin()

    " Utility:
        " Amazing search menu.
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install()  } }

        " view project from tags
        Plug 'preservim/tagbar'

        Plug 'justinmk/vim-sneak'

        " auto tag closing
        Plug 'alvan/vim-closetag'

        " delimiter manipulation
        Plug 'tpope/vim-surround'

        " auto closing delimiters
        Plug 'jiangmiao/auto-pairs'

        " focus mode
        Plug 'junegunn/goyo.vim'

        " directory tree browser, helps for heavily structured
        " django projects
        Plug 'preservim/nerdtree'

    " Cosmetic:
        " evaluate '#XXXXXX' (hex) colors inside files 
        " and highlight as real color value.
        Plug 'ap/vim-css-color'

        " highlight other instances of word under cursor.
        Plug 'RRethy/vim-illuminate'

        " cool status bar
        Plug 'itchyny/lightline.vim'

        " git diff in sign column
        Plug 'airblade/vim-gitgutter'

        Plug 'ryanoasis/vim-devicons'

    " Colorschemes:
        " Blue colorscheme with soft, comfortable colors (my favorite).
        Plug 'arcticicestudio/nord-vim'

        " Retro groove colorscheme
        Plug 'morhetz/gruvbox'

        Plug 'sheerun/vim-polyglot'



    " Language Server:
        " common lsp configuration
        Plug 'neovim/nvim-lspconfig'

        " lsp completion
        Plug 'nvim-lua/completion-nvim'

    call plug#end()

" Settings:
    " Language Server:
        set completeopt=menuone,noinsert,noselect
        let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require'completion'.on_attach()

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  
  -- Set autocommands conditional on server_capabilities
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "tsserver", "ccls", "gopls", "pyls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

    " Interface:
        set splitright
        set splitbelow

    " Plugin Settings:
        " Fzf:
            " Always enable preview window on the right with 60% width
            let g:fzf_preview_window = 'right:60%'
            let g:fzf_layout = { 'window' : { 'width': 0.9, 'height': 0.6, 'highlight': 'Normal' } }

        " Lightline:
            set noshowmode
            let g:lightline = {
                \ 'colorscheme': 'gruvbox',
            \ }

    " Cosmetic:
        " highlight line at 80 column (good for adhering to line limits)
        if exists('+colorcolumn')
            set colorcolumn=80
        else
            augroup ColorColumn
                autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg',
                                \ '\%>80v.\+',
                                \ -1)
            augroup END
        endif

        " list invisible characters like tab
        set list lcs=tab:│\ ,trail:·

        let g:sneak#label = 1

        " higlight background of selected line (lags my computer)
        " set cursorcolumn
        " highlight background of selected column
        set cursorline

        " Vertical split divider character and color.
        set fillchars+=vert:\|

        let g:airline_powerline_fonts = 1

    " Colorschemes:

        set termguicolors

        " Nord:
            let g:nord_italic=1 " always allow italic fonts
            let g:nord_italic_comments=1 " give comments italic font
            let g:nord_underline=1 " always allow underlined text

        " Gruvbox:
            let g:gruvbox_contrast_dark="medium"
            let g:gruvbox_italic=1
            let g:gruvbox_invert_selection=0
            let g:gruvbox_invert_signs=1
            let g:gruvbox_sign_column='bg0'

        colo gruvbox
        hi LspDiagnosticsDefaultError guifg=#fb4934
        hi LspDiagnosticsDefaultWarning guifg=#fabd2f
        hi LspDiagnosticsDefaultInformation guifg=#f9f5d7
        hi LspDiagnosticsDefaultHint guifg=#928374
    
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

    " Hybrid Number:
        " when combined, they have a hybrid effect
        " where the line you are on is the line number,
        " and then adjacent lines start counting upward:
        " 2
        " 1
        "   64
        " 1
        " 2
        set number
        set relativenumber

" Bindings:
    " mapleader must be placed before any other bindings
    let mapleader=' '

    " enable mouse interaction
    set mouse=a

    " Use <Tab> and <S-Tab> to navigate through popup menu
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

    " clear highlight
        nnoremap <C-l> :noh<CR> 

    " Navigation
        nnoremap <C-J> :tabnext<CR>
        nnoremap <C-K> :tabprevious<CR>

        nnoremap H <C-w>h
        nnoremap J <C-w>j
        nnoremap K <C-w>k
        nnoremap L <C-w>l

    " File Commands:
        nnoremap <C-p> :Files<CR>
        nnoremap <C-s> :Rg<CR>

    " Ctags:
        nnoremap <leader>t :TagbarToggle<CR>
    
    " LaTeX:
        function LatexCompile()
            w
            call jobstart('pdflatex ' . expand('%'))
        endfunction

        function XelatexCompile()
            w
            call jobstart('xelatex ' . expand('%'))
        endfunction

        function LatexOpen()
            call jobstart('zathura ' . expand('%:r') . '.pdf')
        endfunction

        nnoremap <leader>c :call XelatexCompile()<CR>
        nnoremap <leader>ac :call LatexCompile()<CR>
        nnoremap <leader>o :call LatexOpen()<CR>

    " Goyo:
        nnoremap <leader>lf :Goyo<CR>

    " NERDTREE Bindings:
        nnoremap <C-n> :NERDTreeToggle<CR>

" Auto Commands:

    autocmd Bufenter *.c,*.h,*.cpp,*.hpp setlocal ts=8 sw=8 softtabstop=8 noexpandtab
    autocmd Bufenter *.html,*.tex setlocal ts=2 sw=2 spell spelllang=en_us
