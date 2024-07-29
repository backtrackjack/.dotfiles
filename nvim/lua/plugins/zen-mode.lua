return {
  'folke/zen-mode.nvim',
  keys = {
    {
      '<leader>zz', '<cmd>ZenMode<CR>',
      { noremap = true, silent = true },
    }
  },
  opts = {
    window = {
      width = 90,
      options = {}
    }
  }
}
