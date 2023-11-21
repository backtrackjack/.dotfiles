return {
  'folke/todo-comments.nvim',
  event = "VeryLazy",
  dependencies = {
    'folke/trouble.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  config = true,
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next [t]odo comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous [t]odo comment',
    },
    { '<leader>xt', '<cmd>TodoTrouble<cr>', desc = '[t]odo list (all)' },
    { '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = '[T]odo/Fix/Fixme list' },
    { '<leader>st', '<cmd>TodoTelescope<cr>', desc = '[t]odo' },
    { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = '[T]odo/Fix/Fixme' },
  },
}
