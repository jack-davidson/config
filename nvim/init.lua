local colorscheme = 'nord'

vim.opt.termguicolors = true
vim.opt.updatetime = 100

require('loader')
vim.opt.showmode = false
vim.opt.number = true
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.fillchars = {
    eob = ' '
}
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.incsearch = true
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>s', '<cmd>SymbolsOutline<CR>')
vim.keymap.set('n', '<leader><leader', '<cmd>Telescope git_files<CR>')
vim.keymap.set('n', '<leader><leader', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>')
vim.keymap.set('n', 'H', '<C-o>')
vim.keymap.set('n', 'L', '<C-i>')
vim.keymap.set('n', ']b', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '[b', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>BufferLinePick<CR>')
vim.keymap.set('n', '<C-J>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<C-K>', '<cmd>tabprev<CR>')
vim.keymap.set('n', 'tt', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>noh<CR>')

vim.cmd([[
hi Comment gui=italic
hi BufferLineFill guibg=#191c23
]])

vim.cmd('colorscheme ' .. colorscheme)
