return {
  'vim-test/vim-test',
  keys = {
    { '<Leader>tn', ':TestNearest<CR>', desc = "Nearest" },
    { '<Leader>tf', ':TestFile<CR>', desc = "File" },
    { '<Leader>ts', ':TestSuite<CR>', desc = "Suite" },
    { '<Leader>tl', ':TestLast<CR>', desc = "Last" },
    { '<Leader>tv', ':TestVisit<CR>', desc = "Visit" },
  },
}
