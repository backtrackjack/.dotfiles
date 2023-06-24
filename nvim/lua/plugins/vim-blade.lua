return {
    "jwalton512/vim-blade",
    config = function()
        vim.api.nvim_create_autocmd("Filetype", {
            pattern = { "blade" },
            callback = function()
                vim.opt_local.commentstring = "{{-- %s --}}"
            end
        })
    end
}
