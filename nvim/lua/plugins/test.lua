return {
    "nvim-neotest/neotest",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-treesitter/nvim-treesitter" },
        { "antoinemadec/FixCursorHold.nvim" },
        { "olimorris/neotest-phpunit" },
        { "theutz/neotest-pest" },
        { "rouge8/neotest-rust" },
        { "nvim-neotest/neotest-vim-test" },
    },
    keys = {
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
        { "<leader>tR", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
        { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
        { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require('neotest-phpunit')({
                    phpunit_cmd = function()
                        return "./vendor/bin/phpunit"
                    end
                }),
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
