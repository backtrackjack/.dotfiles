return {
  'airblade/vim-rooter',
  lazy = false,
  init = function()
    vim.g.rooter_manual_only = 1
    vim.g.rooter_patterns = { '.git', 'composer.json' }
  end,
  config = function()
    vim.cmd 'Rooter'
  end,
} -- roots your cwd to project
