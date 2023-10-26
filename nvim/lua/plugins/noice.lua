return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  opts = function()
    return {
      routes = {
        {
          filter = {
            event = 'notify',
            find = 'No information available',
          },
          opts = { skip = true },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    }
  end,
  keys = {
    {
      '<leader>snl',
      function()
        require('noice').cmd 'last'
      end,
      desc = 'Noice Last Message',
    },
    {
      '<leader>snh',
      function()
        require('noice').cmd 'history'
      end,
      desc = 'Noice History',
    },
    {
      '<leader>sna',
      function()
        require('noice').cmd 'all'
      end,
      desc = 'Noice All',
    },
    {
      '<leader>snd',
      function()
        require('noice').cmd 'dismiss'
      end,
      desc = 'Dismiss All',
    },
  },
}
