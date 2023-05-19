return {
    {
        "folke/neodev.nvim",
        opts = {
            experimental = { pathStrict = true },
            library = { plugins = { "neotest" }, types = true }
        }
    },
    {
        "tpope/vim-rails",
        dependencies = {
            "tpope/vim-bundler",
            "tpope/vim-dispatch",
        }
    },
    -- plugin to "goto" laravel blade components, could be interesting when it works
    {
        "ccaglak/larago.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        filetypes = { "blade", "php" },
        config = function()
            vim.keymap.set("n", "gb", "<cmd>GoBlade<cr>", { noremap = true, silent = true })
        end
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v2.x',
        dependencies = {

            --lsp support
            {
                "neovim/nvim-lspconfig",
                opts = { autoformat = false }
            },
            {
                "williamboman/mason.nvim",
                opts = {
                    ui = { border = 'rounded' }
                }
            },
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
        },
        config = function()
            local lsp = require("lsp-zero")

            lsp.preset("recommended")

            lsp.ensure_installed({
                'tsserver',
                'rust_analyzer',
                'intelephense',
                -- 'solargraph', -- think ruby needs to be latest version for this to work without project gem
                'clangd',
                'lua_ls'
            })

            -- Fix Undefined global 'vim'
            lsp.configure('lua_ls', {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            })

            lsp.configure('intelephense', {
                filetypes = { "php" },
                ignore_filetypes = { "blade" }
            })

            lsp.configure('solargraph', {
                cmd = { "solargraph", "stdio" },
            })

            lsp.configure('clangd', {
                cmd = { "clangd", "--offset-encoding=utf-16" },
            })

            local cmp = require('cmp')
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.config.disable,
                ['<S-Tab>'] = cmp.config.disable,
                ['<CR>'] = cmp.config.disable,
            })

            lsp.setup_nvim_cmp({
                preselect = cmp.PreselectMode.None,
                mapping = cmp_mappings,
            })

            lsp.set_preferences({
                suggest_lsp_servers = false,
            })

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = false
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = true
    },
}
