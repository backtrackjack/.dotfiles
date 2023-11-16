return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠦⣄⠀⠀⠀⠀⠀⠀⣠⠶⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⡞⠀⠀⢈⣧⠀⠀⠀⠀⣼⠁⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠴⣿⣿⠀⠀⠀⠀⣧⠀⠠⣾⣿⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠹⣄⣀⡴⠃⠀⠀⠀⠀⠘⢦⣀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⣀⣀⡀⠀⠀⠀⠀⠉⠀⢀⣠⣤⣤⣄⡀⠀⠉⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀]],
      [[⠀⠀⢸⡏⠉⠛⠷⣤⣤⣤⡴⠞⠋⠉⠀⠀⠉⠙⠷⢦⣤⣤⣤⠾⠋⠉⢹⡇⠀⠀]],
      [[⠀⠀⠘⠳⠶⠶⠶⠶⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡴⠶⠶⠶⠶⠞⠁⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣦⡀⠀⠀⠀⠀⢀⣴⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢶⣤⣤⡶⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    }

    dashboard.section.buttons.val = {
      dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
      dashboard.button('n', '󱨋 ' .. ' Notes', ':ObsidianQuickSwitch<CR>'),
      dashboard.button('c', ' ' .. ' Config', ':e $MYVIMRC <CR>'),
      dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
    }

    -- lsp highlights prefixed with `@` don't have a background color
    ---@diagnostic disable-next-line: unused-local
    local fg_only_highlights = vim.tbl_filter(function(v)
      return string.find(v, '@') ~= nil and string.find(v, '@text.uri') == nil and string.find(v, '@text.underline') == nil
    end, vim.fn.getcompletion('', 'highlight'))

    local all_highlights = vim.fn.getcompletion('', 'highlight')

    local header_hl = all_highlights[math.random(#all_highlights)]
    local button_hl = all_highlights[math.random(#all_highlights)]

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = button_hl
      button.opts.hl_shortcut = button_hl
    end

    dashboard.section.header.opts.hl = header_hl

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
