return {
  'navarasu/onedark.nvim',
  config = function()
    local onedark = require 'onedark'
    onedark.setup {
      style = 'warmer',
    }
    onedark.load()
  end,
}
