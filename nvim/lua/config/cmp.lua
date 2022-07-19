local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local kinds = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "ﰕ",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "廓",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local function border(hl_name)
   return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
   }
end

local cmp = require('cmp')

function next_item(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
    else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    end
end

function prev_item()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
    end
end

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },

    window = {
        completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },

    mapping = {
        ["<C-e>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },

        ["<Tab>"] = cmp.mapping(next_item, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(next_item, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(prev_item, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(prev_item, { "i", "s" }),
    },

    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = kinds[vim_item.kind] or ""
            return vim_item
        end,
    },

    sources = {
        { name = 'vsnip' }, -- For vsnip users.
        { name = "path" },
        { name = "nvim_lsp" },
        { name = 'nvim_lua' },
        { name = "buffer" , keyword_length = 5},
        { name = 'nvim_lsp_signature_help' },
    },

    experimental = {
        ghost_text = true
    }

}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
