vim.g.nord_contrast = false
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true

require('nord').set()

vim.cmd([[
" Popup Menu item
hi PMenu guibg=#3B4252

hi String gui=NONE

" Lsp Diagnostics Borders
hi NormalFloat guibg=#2E3440
hi FloatBorder guifg=#81A1C1

" nvim-cmp highlights
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
]])
