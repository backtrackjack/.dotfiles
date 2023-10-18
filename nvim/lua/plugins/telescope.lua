return {
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = "make",
            },
        },
        cmd = { 'Telescope' },
        keys = {
            { "<leader>/",  "<cmd>Telescope live_grep<cr>",  desc = "Telescope live_grep" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
            {
                "<leader>fF",
                ":lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<cr>",
                desc = "like REALLY find files"
            },
            {
                "<leader>b",
                "<cmd>Telescope buffers<cr>",
                desc =
                "list active buffers"
            },
            -- search
            {
                "<leader>sa",
                "<cmd>Telescope autocommands<cr>",
                desc =
                "autocommands"
            },
            {
                "<leader>sb",
                "<cmd>Telescope current_buffer_fuzzy_find<cr>",
                desc =
                "current buffer fuzzy find"
            },
            {
                "<leader>sc",
                "<cmd>Telescope commands<cr>",
                desc =
                "commands"
            },
            {
                "<leader>sd",
                "<cmd>Telescope diagnostics bufnr=0<cr>",
                desc =
                "document diagnostics"
            },
            {
                "<leader>sD",
                "<cmd>Telescope diagnostics<cr>",
                desc =
                "workspace diagnostics"
            },
            {
                "<leader>sh",
                "<cmd>Telescope help_tags<cr>",
                desc =
                "help pages"
            },
            {
                "<leader>sH",
                "<cmd>Telescope highlights<cr>",
                desc =
                "highlight groups"
            },
            {
                "<leader>sk",
                "<cmd>Telescope keymaps<cr>",
                desc =
                "keymaps"
            },
            {
                "<leader>sM",
                "<cmd>Telescope man_pages<cr>",
                desc =
                "man pages"
            },
            -- ui
            {
                "<leader>uC",
                function() require('telescope.builtin').colorscheme({ enable_preview = true }) end,
                desc =
                "colorscheme picker with preview"
            },
        },
    },
}
