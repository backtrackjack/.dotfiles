return {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        keymaps = {
            ["<C-c"] = false,
            ["<C-h>"] = false,
            ["<C-l>"] = false,
            ["<C-p>"] = false,
            ["<C-s>"] = false,
            ["K"] = "actions.preview",
            ["q"] = "actions.close",
        },
        select = {
            preview = true
        }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "File explorer" } }
}
