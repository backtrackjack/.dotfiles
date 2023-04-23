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
            separator_style = "thin",
        },
        highlights = {
            fill = {
                bg = "#1b1b1b"
            },
            indicator_selected = {
                fg = {
                    attribute = "fg",
                    highlight = "ErrorMsg",
                },
            },
        },
    },
}
