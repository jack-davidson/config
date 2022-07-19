local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

local servers = {
    "pyright",
    "bashls",
    "tsserver",
    "gopls",
    "ccls",
    "vimls",
    "cssls",
    "html",
}

--Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)

    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', require('renamer').rename, {})
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', '<space>S', vim.lsp.buf.document_symbol, {})

    vim.diagnostic.config({
        virtual_text = false,
    })

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- https://github.com/neovim/nvim-lspconfig/wiki
    local function goto_definition(split_cmd)
        local util = vim.lsp.util
        local log = require("vim.lsp.log")
        local api = vim.api

        -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
        return function(_, result, ctx)
            if result == nil or vim.tbl_isempty(result) then
                local _ = log.info() and log.info(ctx.method, "No location found")
                return nil
            end

            if split_cmd then
                vim.cmd(split_cmd)
            end

            if vim.tbl_islist(result) then
                util.jump_to_location(result[1])

                if #result > 1 then
                    util.set_qflist(util.locations_to_items(result))
                    api.nvim_command("copen")
                    api.nvim_command("wincmd p")
                end
            else
                util.jump_to_location(result)
            end
        end
    end

    -- open 'gotodefintions' in a split
    --vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')

    -- https://github.com/neovim/nvim-lspconfig/wiki
    -- show diagnostics window on hover
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'line',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })

    if capabilities.document_formatting then
        vim.api.nvim_create_autocmd({ "BufWrite" }, {
            callback = function()
                vim.lsp.buf.format()
            end,
        })
    end
end

for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
