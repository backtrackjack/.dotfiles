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
map('i', ';;', '<Esc>A;<Esc')
map('i', ',,', '<Esc>A,<Esc')

-- Disable annoying command line thing
map('n', 'q:', ':q<cr>')

map("n", "<c-h>", ":TmuxNavigateLeft<cr>", { silent = true, noremap = true })
map("n", "<c-l>", ":TmuxNavigateRight<cr>", { silent = true, noremap = true })
map("n", "<c-j>", ":TmuxNavigateDown<cr>", { silent = true, noremap = true })
map("n", "<c-k>", ":TmuxNavigateUp<cr>", { silent = true, noremap = true })

map("n", "<leader>nw", ":Neorg workspace work<cr>'", { desc = "Neorg work" })
map("n", "<leader>nn", ":Neorg workspace notes<cr>", { desc = "Neorg notes" })
map("n", "<leader>ni", ":Neorg index<cr>", { desc = "Neorg index" })
map("n", "<leader>nt", ":Neorg toggle-concealer<cr>", { desc = "Neorg toggle-concealer" })
-- map("n", "<leader>np", ":Neorg export to-file export.md<cr>:e export.md<cr>:MarkdownPreview<cr>", { desc = "Neorg preview" })

function neorg_preview()
  local temp_file = vim.fn.tempname() .. ".md"
  vim.cmd("Neorg export to-file " .. temp_file)
  vim.cmd("edit " .. temp_file)
  vim.cmd("MarkdownPreview")
  os.remove(temp_file)
end
vim.api.nvim_command('command! NeorgPreview lua neorg_preview()')
vim.api.nvim_set_keymap("n", "<leader>np", ":NeorgPreview<cr>", { noremap = true, silent = true })
