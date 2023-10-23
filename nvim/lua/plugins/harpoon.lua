return {
    "thePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        global_settings = {
            tabline = true
        }
    },
    init = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to harpoon" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end)
        vim.keymap.set("n", "<C-n>", function() ui.nav_next() end)
        for i = 1, 5 do
            vim.keymap.set(
                "n",
                string.format("<space>%s", i),
                function()
                    ui.nav_file(i)
                end
            )
        end
    end
}
