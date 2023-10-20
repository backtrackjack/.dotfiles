return {
  'epwalsh/obsidian.nvim',
  lazy = true,
  cmd = { 'ObsidianSearch', 'ObsidianOpen' },
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/JSObsidian/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/JSObsidian/**.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'preservim/vim-markdown',
  },
  opts = {
    dir = '~/JSObsidian',
    completion = {
      nvim_cmp = true,
    },
  },
  config = function(_, opts)
    require('obsidian').setup(opts)
    vim.keymap.set('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
      else
        return 'gf'
      end
    end, { noremap = false, expr = true })
  end,
}
