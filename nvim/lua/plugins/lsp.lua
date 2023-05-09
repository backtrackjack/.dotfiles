return {
    {
        "folke/neodev.nvim",
        opts = {
            experimental = { pathStrict = true },
            library = { plugins = { "neotest" }, types = true }
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v2.x',
        dependencies = {

            --lsp support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim", },
            { 'williamboman/mason-lspconfig.nvim' },

            --cmp
            { 'hrsh7th/nvim-cmp', },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            --snip
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
        end
    }

}
