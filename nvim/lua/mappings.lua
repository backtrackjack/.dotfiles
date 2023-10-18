local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

local Util = require('util')

-- lazy
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

-- make ctrl+c act like esc
map("i", "<C-c>", "<Esc>")

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- other buffer
map("n", "<leader><leader>", "<c-^>", { desc = "other buffer" })

-- Disable annoying command line thing
map("n", "q:", ":q<cr>")

-- navigate qflist
map("n", "H", "<cmd>cprev<cr>", { desc = "previous quickfix", silent = true })
map("n", "L", "<cmd>cnext<cr>", { desc = "next quickfix", silent = true })
map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move lines in visual mode
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")

-- Reselect visual selection after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
map('v', 'y', 'myy`y')
map('v', 'Y', 'myY`y')

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

-- Clear search, diff update and redraw (awesome)
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

-- windows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })


-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
for _, c in ipairs({ ",", ".", ";" }) do
    map("i", c, c .. "<c-g>u")
end

-- highlight under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })

-- toggleable things
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function()
    Util.toggle("relativenumber", true)
    Util.toggle("number")
end, { desc = "Toggle Line Numbers" })

local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end,
    { desc = "Toggle Conceal Level" })
