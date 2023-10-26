-- enable byte-compilation (:help lua-loader)
vim.loader.enable()

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    { import = 'plugins' }, -- 'lua/plugins/*.lua'
    { import = 'plugins/mini' }, -- 'lua/plugins/mini/*.lua'
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  install = { colorscheme = { 'kanagawa', 'habamax' } },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrw',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

require 'options'
require 'mappings'
require 'autocommands'
