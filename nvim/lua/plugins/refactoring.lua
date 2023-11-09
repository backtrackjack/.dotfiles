return {
  'theprimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    prompt_func_return_type = {
      php = true,
    },
    prompt_func_param_type = {
      php = true,
    }
  },
  config = true,
  cmd = { 'Refactor' },
  keys = {
    {
      '<leader>rr',
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
    },
  },
}
