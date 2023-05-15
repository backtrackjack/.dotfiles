-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- ensures new directories and files are created on save if they don't exist
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("auto_create_directory"),
    callback = function()
        vim.fn.mkdir(vim.fn.expand("%:p:h"), "p")
    end,
})

-- set/unset some options for non-code filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("notes_docs_config"),
    pattern = { "gitcommit", "markdown", "norg", "org", "text", "vimwiki" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.conceallevel = 1
        vim.opt_local.colorcolumn = ''
    end,
})

-- remove colorcolumn for some filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("no_colorcolumn_html"),
    pattern = { "html", "blade", "eruby" },
    callback = function()
        vim.opt_local.colorcolumn = ''
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "fugitive",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query",
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

-- disable comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup("no_nl_comment"),
    callback = function()
        vim.opt.formatoptions:remove { "c", "r", "o" }
    end,
})

-- update file when there are external changes
vim.api.nvim_create_autocmd("FocusGained", {
    group = augroup("refresh_from_external"),
    callback = function()
        vim.cmd "checktime"
    end,
})

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup("remove_trailing_whitespace_on_save"),
    callback = function()
        vim.cmd [[%s/\s\+$//e]]
    end,
})
