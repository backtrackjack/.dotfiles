return {
    enabled = true,
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            always_show_bufferline = true,
            indicator = {
                icon = '| ',
                style = "icon",
            },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diag)
                local icons = require("lazyvim.config").icons.diagnostics
                local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                    .. (diag.warning and icons.Warn .. diag.warning or "")
                return vim.trim(ret)
            end,
            show_close_icon = false,
            tab_size = 0,
            max_name_length = 25,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "  Files",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            separator_style = "slope",
            custom_areas = {
                left = function()
                    return {
                        { text = '    ', fg = '#8fff6d' },
                    }
                end
            }
        },
        highlights = {
            fill = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            background = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            tab = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            tab_close = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            close_button = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
                fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
            },
            close_button_visible = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
                fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
            },
            close_button_selected = {
                fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
            },
            buffer_visible = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            modified = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            modified_visible = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            duplicate = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            duplicate_visible = {
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            separator = {
                fg = { attribute = 'bg', highlight = 'StatusLine' },
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            separator_selected = {
                fg = { attribute = 'bg', highlight = 'StatusLine' },
                bg = { attribute = 'bg', highlight = 'Normal' }
            },
            separator_visible = {
                fg = { attribute = 'bg', highlight = 'StatusLine' },
                bg = { attribute = 'bg', highlight = 'StatusLine' },
            },
            indicator_selected = {
                fg = { attribute = "fg", highlight = "ErrorMsg" },
            },
        },
    },
}
