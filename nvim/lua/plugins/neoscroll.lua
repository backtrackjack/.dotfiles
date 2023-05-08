return {
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                mappings = { '<C-u>', '<C-d>', 'zz', 'zt', 'zb' }
            })

            require("neoscroll.config").set_mappings({
                ["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "50" } },
                ["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "50" } },
            })
        end,
        enabled = function()
            if vim.g.neovide then
                return false
            end
            return true
        end,
    },
}
