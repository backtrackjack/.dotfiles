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
            { 'hrsh7th/cmp-emoji' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            --snip
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' }
        }
    },
}
