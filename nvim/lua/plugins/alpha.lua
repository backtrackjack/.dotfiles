return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.buttons.val = {
      dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
      dashboard.button('r', ' ' .. ' Recent', ':Telescope oldfiles <CR>'),
      dashboard.button('n', '󱓧 ' .. ' Notes', ':ObsidianQuickSwitch <CR>'),
      dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
      dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'Label'
      button.opts.hl_shortcut = 'Statement'
    end

    dashboard.section.header.opts.hl = 'String'
    dashboard.section.footer.opts.hl = 'Type'

    dashboard.opts.layout[1].val = 10
    dashboard.opts.layout[3].val = 3

    return dashboard
  end,
  config = function(_, dashboard)
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        once = true,
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end
    require('alpha').setup(dashboard.opts)
  end,
}
