return {
  { 'sickill/vim-pasta' }, -- smart formatting on paste
  { 'tpope/vim-sleuth' }, -- automatically detect indent settings
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-repeat' }, -- Allow plugins to enable repeating of commands
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  }, -- Text objects for HTML attributes
  {
    'tpope/vim-fugitive',
    dependencies = 'tpope/vim-rhubarb',
    keys = { { mode = { 'n' }, '<leader>gg', vim.cmd.Git } },
  }, -- GIT
  { 'jwalton512/vim-blade' }, -- blade support
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  { 'github/copilot.vim' }, -- taking our jobs
  {
    'folke/trouble.nvim',
    init = function()
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true, desc = 'TroubleToggle' })
    end,
  }, -- diagnostics in quickfix list
}
