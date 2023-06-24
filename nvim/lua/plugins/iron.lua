return {
    "Vigemus/iron.nvim",
    ft = { "php" },
    config = function()
        local iron = require("iron.core")
        iron.setup{
            config = {
                scratch_repl = true,
                repl_definition = {
                    php = {
                        command = { 'php', 'artisan', 'tinker' }
                    }
                },
                repl_open_cmd = "vertical botright 80 split"
            },
            -- TODO: sensible keymaps
            -- keymaps = {
            --     send_file = "<space>sf",
            -- }
        }
    end
}
