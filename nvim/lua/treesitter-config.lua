require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "python",
        "lua",
        "html",
        "css",
        "javascript",
        "go",
    },

    highlight = {
        enable = false,
    },
}
