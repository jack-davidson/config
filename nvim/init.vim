" ~/.config/nvim/init.vim

" This NeoVim configuration aims to
" be easy to maintain and highly documented.
" Configuration is only added once it is
" fully understood. Configuration is written
" in a heirarchical format.
" ex:
"
"	" Configuration Category:
"		" Configuration Title:
"			" configuration comment/documentation link
"			<configuration command>

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

		" auto tag closing
		Plug 'alvan/vim-closetag'

		" delimeter manipulation
		Plug 'tpope/vim-surround'

		" auto closing delimiters
		Plug 'jiangmiao/auto-pairs'

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

	" Colorschemes:
		" Blue colorscheme with soft, comfortable colors (my favorite).
		Plug 'arcticicestudio/nord-vim'

		" Retro groove colorscheme
		Plug 'morhetz/gruvbox'

	" Language Server:
		" common lsp configuration
		Plug 'neovim/nvim-lspconfig'

		" lsp completion
		Plug 'nvim-lua/completion-nvim'
	
	" Completion:
		Plug 'ervandew/supertab'

	call plug#end()

" Settings:
	" Completion:
		set completeopt=menuone,noinsert,noselect
		let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
		lua require'nvim_lsp'.ccls.setup{ on_attach=require'completion'.on_attach }
		lua require'nvim_lsp'.jedi_language_server.setup{ on_attach=require'completion'.on_attach }

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
				\ 'colorscheme': 'nord',
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


	" higlight background of selected line (lags my computer)
	" set cursorcolumn
	" highlight background of selected column
	set cursorline

	" Vertical split divider character and color.
	set fillchars+=vert:\|

	" Colorschemes:

		set termguicolors

		" Nord:
			let g:nord_italic=1 " always allow italic fonts
			let g:nord_italic_comments=1 " give comments italic font
			let g:nord_underline=1 " always allow underlined text

		" Gruvbox:
			let g:gruvbox_contrast_dark="soft"

		colorscheme nord

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

	nnoremap <C-J> :tabnext<CR>
	nnoremap <C-K> :tabprevious<CR>

	nnoremap H <C-w>h
	nnoremap J <C-w>j
	nnoremap K <C-w>k
	nnoremap L <C-w>l

	nnoremap <C-p> :Files<CR>
	nnoremap <C-s> :Rg<CR>

	" supertab bindings
	let g:SuperTabDefaultCompletionType = '<c-n>'

" Auto Commands:
	autocmd BufEnter *.html setlocal ts=2 sw=2
	augroup VCenterCursor
		au!
		au BufEnter,WinEnter,WinNew,VimResized *,*.*
			\ let &scrolloff=winheight(win_getid())/3
	augroup END
