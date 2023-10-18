return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'MunifTanjim/nui.nvim' },
  },
  opts = {
    routes = {
      {
        filter = {
          event = 'msg_show',
          find = '%d+L, %d+B',
        },
        view = 'mini',
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
    lsp = {
      hover = {
        silent = true,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
  },
}
