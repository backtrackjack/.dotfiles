-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- chatgpt did this but it works
-- ensures new directories and files are created on save if they don't exist
vim.api.nvim_command("augroup AutoCreateDirectory")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command('autocmd BufWritePre * silent! execute "!mkdir -p " .. shellescape(expand("%:p:h"))')
vim.api.nvim_command("augroup END")

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("notes_docs_config"),
    pattern = { "gitcommit", "markdown", "norg" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.conceallevel = 1
        vim.opt_local.colorcolumn = ''
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = augroup("no_colorcolumn_html"),
    pattern = { "html", "blade", "eruby"},
    callback = function()
        vim.opt_local.colorcolumn = ''
    end,
})
--
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query", -- :InspectTree
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-summary",
        "neotest-output",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("no_nl_comment"),
    callback = function()
        vim.opt.formatoptions:remove {"c", "r", "o"}
    end, -- disable comment on new line
})

vim.api.nvim_create_autocmd("FocusGained", {
    group = augroup("refresh_from_external"),
    callback = function()
        vim.cmd "checktime"
    end,
    desc = "update file when there are changes"
})
