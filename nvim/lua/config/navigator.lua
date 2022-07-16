return function()
    require('Navigator').setup()

    -- Keybindings
    vim.keymap.set('n', "<C-w>h", '<CMD>NavigatorLeft<CR>')
    vim.keymap.set('n', "<C-w>l", '<CMD>NavigatorRight<CR>')
    vim.keymap.set('n', "<C-w>k", '<CMD>NavigatorUp<CR>')
    vim.keymap.set('n', "<C-w>j", '<CMD>NavigatorDown<CR>')
    vim.keymap.set('n', "<C-w>p", '<CMD>NavigatorPrevious<CR>')

    vim.keymap.set('n', "<C-g>h", '<CMD>NavigatorLeft<CR>')
    vim.keymap.set('n', "<C-g>l", '<CMD>NavigatorRight<CR>')
    vim.keymap.set('n', "<C-g>k", '<CMD>NavigatorUp<CR>')
    vim.keymap.set('n', "<C-g>j", '<CMD>NavigatorDown<CR>')
    vim.keymap.set('n', "<C-g>p", '<CMD>NavigatorPrevious<CR>')
end
