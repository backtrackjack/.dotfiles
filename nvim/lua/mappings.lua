local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('x', '<leader>p', '"_dP', { desc = '[p]aste without replacing register' })

-- lazy
map('n', '<leader>ll', '<cmd>:Lazy<cr>', { desc = '[l]azy' })
map('n', '<leader>lc', '<cmd>:e $MYVIMRC<cr>', { desc = '[c]onfig' })

-- make ctrl+c act like esc
map('i', '<C-c>', '<Esc>')

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = '[n]ew File' })

-- other buffer
map('n', '<leader><leader>', '<c-^>', { desc = 'Other buffer' })

-- Disable annoying command line thing
map('n', 'q:', ':q<cr>')

map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Easy insertion of a trailing ; or , from insert mode
map('i', ';;', '<Esc>A;<Esc>')
map('i', ',,', '<Esc>A,<Esc>')

-- Clear search, diff update and redraw (awesome)
map('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', { desc = 'Redraw / clear hlsearch / diff update' })

-- windows
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ 'n', 'x', 'o' }, 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map({ 'n', 'x', 'o' }, 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Add undo break-points
for _, c in ipairs { ',', '.', ';' } do
  map('i', c, c .. '<c-g>u')
end

-- highlight under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })

-- toggleable things
map('n', '<leader>us', function()
  require('util').toggle 'spell'
end, { desc = 'Toggle Spelling' })
map('n', '<leader>uw', function()
  require('util').toggle 'wrap'
end, { desc = 'Toggle Word Wrap' })
map('n', '<leader>ul', function()
  require('util').toggle('relativenumber', true)
  require('util').toggle 'number'
end, { desc = 'Toggle Line Numbers' })

local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map('n', '<leader>uc', function()
  require('util').toggle('conceallevel', false, { 0, conceallevel })
end, { desc = 'Toggle Conceal Level' })
