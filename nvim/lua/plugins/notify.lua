return {
  {
    'rcarriga/nvim-notify',
    keys = {
      {
        '<leader>un',
        function()
          require('notify').dismiss { silent = true, pending = true }
        end,
        desc = 'Dismiss all Notifications',
      },
    },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
    },
    init = function()
      local Util = require 'util'
      if not Util.has 'noice.nvim' then
        Util.on_very_lazy(function()
          vim.notify = require 'notify'
        end)
      end
    end,
    config = function(_, opts)
      require('notify').setup(opts)
      -- show tip on startup
      require('plenary.job')
        :new({
          command = 'curl',
          args = { 'https://www.vimiscool.tech/neotip?vim' },
          on_exit = function(j, exit_code)
            local res = table.concat(j:result())
            if exit_code ~= 0 then
              res = 'Error fetching tip: ' .. res
            end
            require 'notify'(res, 2, { title = 'Tip!' })
          end,
        })
        :start()
    end,
  },
}
