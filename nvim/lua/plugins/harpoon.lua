return {
    "thePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<C-t>", function() ui.nav_prev() end)
        vim.keymap.set("n", "<C-n>", function() ui.nav_next() end)
        vim.keymap.set("n", "1", function() ui.nav_file(1) end)
        vim.keymap.set("n", "2", function() ui.nav_file(2) end)
        vim.keymap.set("n", "3", function() ui.nav_file(3) end)
        vim.keymap.set("n", "4", function() ui.nav_file(4) end)
    end
}
