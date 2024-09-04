return {
  'ribru17/bamboo.nvim',
  lazy = false,
  config = function()
    local bamboo = require 'bamboo'
    bamboo.setup {
      style = 'multiplex',
      highlights = {
        ['ColorColumn'] = { bg = '#1F241E' },
      },
    }
    bamboo.load()
  end,
}
