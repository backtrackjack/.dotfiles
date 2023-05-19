-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.neorg_default_action_create_item = 1
vim.g.neorg_default_action_create_directory = 1

-- neovide opts
if vim.g.neovide then
    vim.g.neovide_scroll_animation_length = 0.5
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.o.guifont = "Jetbrains Mono"
end

vim.g.intelephense_disabled_client = { 'blade' }

vim.opt.syntax = 'off'

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'

vim.opt.conceallevel = 0
vim.opt.colorcolumn = '80'
vim.opt.autochdir = true
vim.opt.guifont = { "FantasqueSansMono NF", "h20" }
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.breakindent = true              -- maintain indent when wrapping indented lines
vim.opt.list = true                     -- enable the below listchars
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
vim.opt.mouse = 'a'                     -- enable mouse for all modes
vim.opt.clipboard = 'unnamedplus'       -- Use system clipboard
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.confirm = true                 -- ask for confirmation instead of erroring
vim.opt.shortmess:append({ I = true }) -- disable the splash screen
vim.opt.wildmode =
'longest:full,full'                    -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.signcolumn = 'yes:1'
vim.opt.showmode = false
vim.opt.updatetime = 4001  -- Set updatime to 1ms longer than the default to prevent polyglot from changing it
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.isfname:append("@-@")
