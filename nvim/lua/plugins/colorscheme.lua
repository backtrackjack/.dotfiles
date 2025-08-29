return {
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    -- config = function()
    --   local bamboo = require 'bamboo'
    --   bamboo.setup {
    --     style = 'multiplex',
    --     highlights = {
    --       ['ColorColumn'] = { bg = '#1F241E' },
    --     },
    --   }
    --   bamboo.load()
    -- end,
  },
  {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.everforest_enable_italic = true
        vim.g.everforest_background = 'hard'
        vim.cmd.colorscheme('everforest')
      end
  },
}
