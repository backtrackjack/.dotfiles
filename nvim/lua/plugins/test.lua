return {
    "nvim-neotest/neotest",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
        { "antoinemadec/FixCursorHold.nvim" },
        { "theutz/neotest-pest" },
        { "rouge8/neotest-rust" },
        { "nvim-neotest/neotest-vim-test" },
    },
    keys = {
        { '<leader>tS', '<cmd>lua require("neotest").run.run("./tests")<cr>', { desc = "Test Suite", silent = true }},
        { '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<cr>', { desc = "Test Suite", silent = true }},
        { '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', { desc = "Test File", silent = true }},
        { '<leader>tn', '<cmd>lua require("neotest").run.run()<cr>', { desc = "Test Nearest", silent = true }},
        { '<leader>tc', '<cmd>lua require("neotest").run.stop()<cr>', { desc = "Test Cancel", silent = true }},
        { '<leader>ta', '<cmd>lua require("neotest").run.attach()<cr>', { desc = "Attach to nearest test", silent = true }},
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require('neotest-pest')({
                    pest_cmd = function()
                        return "./vendor/bin/pest"
                    end
                }),
                require('neotest-vim-test')({
                    ignore_file_types = { "php" }
                }),
                require('neotest-rust') -- uses nextest https://nexte.st/book/pre-built-binaries.html
            },
            discovery = {
                -- don't include vendor in test suite
                filter_dir = function(name, rel_path, root)
                    return name ~= "vendor"
                end
            }
        })
    end
}
