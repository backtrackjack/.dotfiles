return {
  'theprimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
  },
  cmd = { 'Refactor' },
  keys = {
    {
      '<leader>rr',
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
    },
  },
  config = true,
}
