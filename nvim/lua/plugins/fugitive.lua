return {
  'tpope/vim-fugitive', -- GIT
  dependencies = {
    'tommcdo/vim-fubitive',
    'tpope/vim-rhubarb',
  },
  cmd = { 'GBrowse', 'G' },
  keys = {
    { mode = { 'n' }, '<leader>gg', '<cmd>vertical Git<cr>', desc = 'Open fugitive' },
  },
}
