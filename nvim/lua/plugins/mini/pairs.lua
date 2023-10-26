return {
  'echasnovski/mini.pairs',
  init = function()
    require('mini.pairs').setup {
      mappings = {
        ['`'] = false,
      },
    }
  end,
}
