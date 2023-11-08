return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<c-e>', '<cmd>GrapplePopup tags<cr>' },
    { '<leader>+', '<cmd>GrappleTag<cr>', desc = '[+] grapple list' },
    { 'L', '<cmd>GrappleCycle forward<cr>', desc = 'Cycle grapple forward' },
    { 'H', '<cmd>GrappleCycle backward<cr>', desc = 'Cycle grapple backward' },
  },
}
