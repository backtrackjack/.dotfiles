return {
  {
    'airblade/vim-rooter',
    init = function()
      vim.g.rooter_manual_only = 1
      vim.g.rooter_patterns = { '.git', 'composer.json' }
    end,
    config = function()
      vim.cmd('Rooter')
    end
  }, -- roots your cwd to project
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
  }, -- GIT
  { 'jwalton512/vim-blade' }, -- blade support
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
}
