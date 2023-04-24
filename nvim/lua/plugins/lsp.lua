return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            autoformat = false,
            servers = {
                tailwindcss = {
                    filetypes = { "html", "css", "scss", "javascript", "typescript", "vue", "blade" },
                    ignore_filetypes = { "php" }, -- Add this line to ignore PHP files
                },
                intelephense = {
                    filetypes = { "php" },
                    ignore_filetypes = { "blade" },
                    on_attach = function(client, bufnr)
                        local filetypes = { "php" }
                        if vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentFormattingRangeProvider = false
                            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
                        end
                    end,
                },
            },
        },
    },
    {
        "folke/neodev.nvim",
        opts = {
            experimental = { pathStrict = true },
            library = { plugins = { "neotest" }, types = true }
        }
    }
}
