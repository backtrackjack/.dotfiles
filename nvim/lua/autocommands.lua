local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- show vim tip on startup
vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("vimtip"),
    callback = function()
        local job = require('plenary.job')
        job:new({
            command = 'curl',
            args = { 'https://vtip.43z.one' },
            on_exit = function(j, exit_code)
                local res = table.concat(j:result())
                if exit_code ~= 0 then
                    res = "Error fetching tip: " .. res
                end
                vim.notify(res, 2, { title = "Tip!" })
            end,
        }):start()
    end
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup("last_loc"),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
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
        "fugitive",
        "neotest-output-panel",
        "PlenaryTestPopup",
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
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
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

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- TODO: move to snippet module when created
-- forget snippet when changing mode
-- vim.api.nvim_create_autocmd("ModeChanged", {
    -- group = augroup("UnlinkSnippetOnModeChange"),
    -- pattern = { 's:n', 'i:*' },
    -- desc = 'Forget the current snippet when leaving the insert mode',
    -- callback = function(evt)
        -- if
            -- luasnip.session
            -- and luasnip.session.current_nodes[evt.buf]
            -- and not luasnip.session.jump_active
        -- then
            -- luasnip.unlink_current()
        -- end
    -- end,
-- })
