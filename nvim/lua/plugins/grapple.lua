return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<c-e>', '<cmd>GrapplePopup tags<cr>' },
    { '<leader>a', '<cmd>GrappleTag<cr>', desc = '[a]dd to grapple' },
    { 'L', '<cmd>GrappleCycle forward<cr>', desc = 'Cycle grapple forward' },
    { 'H', '<cmd>GrappleCycle backward<cr>', desc = 'Cycle grapple backward' },
  },
}
