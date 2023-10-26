return {
  'folke/todo-comments.nvim',
  cmd = { 'TodoTrouble' },
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
    { '<leader>xT', '<cmd>TodoTrouble<cr>', desc = '[T]odo list (all)' },
    { '<leader>xt', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = '[t]odo/Fix/Fixme list' },
  },
}
