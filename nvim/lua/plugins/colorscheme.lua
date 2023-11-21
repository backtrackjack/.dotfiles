return {
  'ribru17/bamboo.nvim',
  lazy = false,
  config = function()
    local bamboo = require 'bamboo'
    bamboo.setup()
    bamboo.load()
  end,
}
