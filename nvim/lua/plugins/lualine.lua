return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local icons = require("lazyvim.config").icons

        local function fg(name)
            return function()
                ---@type {foreground?:number}?
                local hl = vim.api.nvim_get_hl_by_name(name, true)
                return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
            end
        end

        return {
            options = {
                theme = "auto",
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        separator = { left = '', right = '' },
                        right_padding = 2
                    }
                },
                lualine_b = {
                    { "branch" },
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                    },
                },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    },
                    {
                        function() return require("nvim-navic").get_location() end,
                        cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                    },
                },
                lualine_x = {
                    {
                        function()
                            local clients = vim.lsp.buf_get_clients(0)
                            if not clients or #clients == 0 then
                                return ""
                            end
                            local active_servers = {}
                            for _, client in ipairs(clients) do
                                table.insert(active_servers, client.name)
                            end
                            return "[" .. table.concat(active_servers, ", ") .. "]"
                        end
                    },
                    -- stylua: ignore
                    {
                        function() return "  " .. require("dap").status() end,
                        cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                        color = fg("Debug"),
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.command.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                        color = fg("Statement"),
                    },
                    -- stylua: ignore
                    {
                        function() return require("noice").api.status.mode.get() end,
                        cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                        color = fg("Constant"),
                    },
                    { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
                },
                lualine_y = {},
                lualine_z = {
                    {
                        "filename",
                        path = 1,
                        separator = { left = '', right = '' },
                        padding = { left = 1, right = 1 }
                    },
                    {
                        "filetype",
                        icon_only = true,
                        separator = { right = '' },
                        padding = { left = 1, right = 1 },
                        color = { bg = 'white' },
                    },
                }
            },
            extensions = { "neo-tree", "lazy" },
        }
    end,
}
