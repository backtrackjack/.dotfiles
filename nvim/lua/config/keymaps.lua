-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("i", "<C-c>", "<Esc>")

-- go to other buffer
map("n", "<leader><leader>", "<c-^>", { desc = "other buffer" })

-- navigiate quickfix
map("n", "H", "<cmd>cprev<cr>", { desc = "previous quickfix", silent = true })
map("n", "L", "<cmd>cnext<cr>", { desc = "next quickfix", silent = true })

map("n", "<CR>", ":noh<CR><CR>", { desc = "clear search highlight" })

-- find _all_ files
map(
    "n",
    "<leader>fF",
    ":lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<cr>",
    { noremap = true, silent = true }
)

-- search open buffers
map('n', '<leader>b',
    function()
        require('telescope.builtin').buffers({
            sort_mru = true,
            ignore_current_buffer = true,
        })
    end
)

-- move lines in visual mode
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")

-- undo tree
map('n', '<leader>ut', ':UndotreeToggle<cr>')

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
map('v', 'y', 'myy`y')
map('v', 'Y', 'myY`y')

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

-- Disable annoying command line thing
map({ 'n' }, 'q:', ':q<cr>')

map("n", "<c-h>", ":TmuxNavigateLeft<cr>", { silent = true, noremap = true })
map("n", "<c-l>", ":TmuxNavigateRight<cr>", { silent = true, noremap = true })
map("n", "<c-j>", ":TmuxNavigateDown<cr>", { silent = true, noremap = true })
map("n", "<c-k>", ":TmuxNavigateUp<cr>", { silent = true, noremap = true })

map("n", "<leader>nn", ":Neorg workspace notes<cr>", { desc = "Neorg notes" })
map("n", "<leader>nw", ":Neorg workspace work<cr>", { desc = "Neorg work" })
map("n", "<leader>nc", ":Neorg toggle-concealer<cr>", { desc = "Neorg toggle-concealer" })
map("n", "<leader>nt", ":Neorg toc qflist<cr>", { desc = "Neorg table of contents" })

vim.api.nvim_command('command! NeorgPreview lua neorg_preview()')
vim.api.nvim_set_keymap("n", "<leader>np", ":NeorgPreview<cr>", { noremap = true, silent = true, desc = "Neorg Preview" })
