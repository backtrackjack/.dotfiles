return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
    },
    config = function()
        -- load refactoring Telescope extension
        require("telescope").load_extension("refactoring")

        -- remap to open the Telescope refactoring menu in visual mode
        vim.api.nvim_set_keymap(
            "v",
            "<leader>ri",
            [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR> ]],
            { noremap = true, silent = true, expr = false }
        )
    end
}
