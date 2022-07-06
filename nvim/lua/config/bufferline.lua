require('bufferline').setup {
    options = {
        show_close_icon = true,
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        show_buffer_close_icons = false,
        separator_style = "thick",
        offsets = {{ filetype = "NvimTree", text = "File Explorer" }},
    }
}
