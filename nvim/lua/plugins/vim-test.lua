return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>', desc = 'Nearest', remap = false },
    { '<Leader>tf', ':TestFile<CR>', desc = 'File', remap = false },
    { '<Leader>ts', ':TestSuite<CR>', desc = 'Suite', remap = false },
    { '<Leader>tl', ':TestLast<CR>', desc = 'Last', remap = false },
    { '<Leader>tv', ':TestVisit<CR>', desc = 'Visit', remap = false },
  },
  config = function()
    vim.cmd [[let test#php#phpunit#executable = 'php artisan test']]
    vim.cmd [[let test#php#pest#executable = 'php artisan test']]
  end
}
