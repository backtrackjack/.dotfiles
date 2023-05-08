return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
        local dashboard = require("alpha.themes.dashboard")
        local logo = [[
            .________.
         .__! .____. |
         | .__!  n | |
     .___| |___. e | |_______._.___.
     | ._| |_. | o | | ._________. |
 .___| |_|_|_| |___|_|_|_____| |_|_|___.
 |  _| |_____| |_____________| |_____  |
 | | | !_| |_|_|___|_| |_____|_|_! | | |
 | | !___| |_________| |___________! | |
 | | .___|_|_| |___| | | .___| |___. | |
 | | | ._____| |_. | | | | ._| |_. | | |
 | | | !_| |_! | | | | !_| |_|_|_! | | |
 | | !___| |___! | | |___| |_______| | |
 | | .___|_|_____| |_|___|_|_| |___. | |
 | | | ._________| |_________| |_. | | |
 | |_|_|_| |_____|_|_|___| |_|_|_| |_| |
 !_______| |_____________| |_____| |___!
     | !_|_|_____! | | v | !_| |_! |
     !_____________| | i !___| |___!
                   | | m .___! |
      github.com   | !___! .___!
    /backtrackjack !_______!
    ]]
        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
            -- dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
            dashboard.button("n", " " .. " Notes", ":Neorg index <CR>"),
            dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
            dashboard.button("q", " " .. " Quit", ":qa<CR>"),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "Label"
            button.opts.hl_shortcut = "Statement"
        end
        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "String"
        dashboard.opts.layout[1].val = 2
        return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local handle = io.popen('fortune')
                local fortune = handle:read("*a")
                handle:close()
                dashboard.section.footer.val = vim.split(fortune, "\n")
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
