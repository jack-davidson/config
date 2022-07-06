require('bufferline').setup {
    options = {
        mode = "tabs",
        enforce_regular_tabs = true,
        numbers = "ordinal",
        separator_style = "thick",
        show_close_icon = false,
        show_buffer_close_icons = false,
        sort_by = "tabs",
        offsets = {{ filetype = "NvimTree", text = "File Explorer" }},
    }
}
