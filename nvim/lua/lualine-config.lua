require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'nord',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {'filename'},
        lualine_c = {'diagnostics'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        --[[
        lualine_a = {
            {
                'buffers',
                show_filename_only = true,     -- Shows shortened relative path when set to false.
                hide_filename_extension = false,     -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.

                mode = 0, -- 0: Shows buffer name
                                    -- 1: Shows buffer index
                                    -- 2: Shows buffer name + buffer index 
                                    -- 3: Shows buffer number
                                    -- 4: Shows buffer name + buffer number

                max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                                                                                        -- it can also be a function that returns
                                                                                        -- the value of `max_length` dynamically.
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha'
                }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

                buffers_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal',         -- Color for active buffer.
                    inactive = 'lualine_b_inactive', -- Color for inactive buffer.
                },

                symbols = {
                    modified = ' ●',            -- Text to show when the buffer is modified
                    alternate_file = '#', -- Text to show to identify the alternate file
                    directory =    '',         -- Text to show when the buffer is a directory
                },
            }
        },
        lualine_z = {
            {
                'tabs',
                max_length = vim.o.columns / 3, -- Maximum width of tabs component.
                -- Note:
                -- It can also be a function that returns
                -- the value of `max_length` dynamically.
                mode = 1, -- 0: Shows tab_nr
                -- 1: Shows tab_name
                -- 2: Shows tab_nr + tab_name

                tabs_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal',         -- Color for active tab.
                    inactive = 'lualine_b_inactive', -- Color for inactive tab.
                }
            }
        },
        ]]--
    },
    extensions = {},
}
