local opt = vim.opt

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- neovide opts
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0.5 -- Set scroll animation length in Neovide
  vim.g.neovide_cursor_vfx_mode = 'pixiedust' -- Set cursor visual effects mode in Neovide
  opt.guifont = 'Jetbrains Mono' -- Set GUI font to Jetbrains Mono
end

opt.autochdir = true -- Automatically change to the directory of the current file
opt.backup = false -- Disable creation of backup files
opt.breakindent = true -- Maintain indent when wrapping indented lines
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.cmdheight = 0 -- command line height
opt.colorcolumn = '80' -- Highlight column 80
opt.completeopt = 'menuone,noselect' -- better completion experience
opt.conceallevel = 0 -- Disable text concealment
opt.confirm = true -- Ask for confirmation instead of erroring
opt.expandtab = true -- Expand <Tab> to spaces
opt.fillchars:append { eob = ' ' } -- Remove the ~ from end of buffer
opt.foldenable = true -- Enable folding
opt.foldlevel = 99 -- Set initial fold level to 99
opt.foldlevelstart = 99 -- Set fold level on opening a file to 99
opt.foldmethod = 'indent' -- Set fold method to 'indent'
opt.ignorecase = true -- Ignore case in search patterns
opt.isfname:append '@-@' -- Allow '@' and '-' as part of a word in file names
opt.list = true -- Enable display of special characters
opt.listchars = { tab = '▸ ', trail = '·' } -- Set characters for tabs and trailing spaces
opt.mouse = 'a' -- Enable mouse for all modes
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.scrolloff = 8 -- Minimum number of lines to keep above and below the cursor
opt.shiftwidth = 4 -- Set the number of spaces for each level of indentation
opt.shortmess:append { I = true } -- Disable the splash screen
opt.showmode = false -- Hide the mode indicator
opt.sidescrolloff = 8 -- Minimum number of columns to keep to the left and right of the cursor
opt.signcolumn = 'yes:1' -- Always display the sign column with a width of 1
opt.smartcase = true -- Use case-sensitive search if there is a capital letter in the pattern
opt.smartindent = true -- Enable smart indentation
opt.softtabstop = 4 -- Set the number of spaces that a <Tab> in insert mode uses
opt.spell = false -- Disable spell checking
opt.splitbelow = true -- Split new windows below the current window
opt.splitright = true -- Split new windows to the right of the current window
opt.swapfile = false -- Disable creation of swap files
opt.tabstop = 4 -- Set the number of spaces a <Tab> counts for
opt.timeout = true -- Enable timeout
opt.timeoutlen = 300 -- Set timeout length to 300ms
opt.title = true -- Set the title of the window to the name of the current file
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- Set the directory for undo files
opt.undofile = true -- Enable persistent undo
opt.wildmode = 'longest:full,full' -- Set wildmode to complete the longest common match and allow tabbing the results to fully complete them
opt.wrap = false -- Disable line wrapping
