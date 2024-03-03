return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<c-e>', '<cmd>Grapple open_tags<cr>' },
    { '<leader>+', '<cmd>Grapple tag<cr>', desc = '[+] grapple list' },
    { 'L', '<cmd>Grapple cycle forward<cr>', desc = 'Cycle grapple forward' },
    { 'H', '<cmd>Grapple cycle backward<cr>', desc = 'Cycle grapple backward' },
  },
}
