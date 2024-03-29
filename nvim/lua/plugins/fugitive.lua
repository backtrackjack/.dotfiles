return {
  'tpope/vim-fugitive', -- GIT
  lazy = false,
  dependencies = {
    'tommcdo/vim-fubitive',
    'tpope/vim-rhubarb',
  },
  cmd = { 'GBrowse', 'G' },
  keys = {
    { mode = { 'n' }, '<leader>gg', '<cmd>vertical Git<cr>', desc = 'Open fu[g]itive' },
    { mode = { 'n' }, '<leader>gl', '<cmd>vertical Git log<cr>', desc = '[l]og' },
    { mode = { 'n' }, '<leader>gL', '<cmd>vertical Git reflog<cr>', desc = 'ref[L]og' },
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup('Fugitive', { clear = true })
    vim.api.nvim_create_autocmd('BufEnter', {
      group = augroup,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        if not require('util').has 'noice' then
          vim.cmd [[set cmdheight=1]] -- to avoid extra key press on some actions see: https://www.reddit.com/r/neovim/comments/tturkx/can_i_automatically_hide_press_enter_or_type/
        end

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = vim.api.nvim_get_current_buf()
          opts.remap = false
          opts.silent = opts.silent ~= false
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        map('n', '<leader>P', ':Git push<cr>', { desc = '[P]ush' })

        map('n', '<leader>p', ':Git pull <cr>', { desc = '[p]ull' })

        -- track branch
        map('n', '<leader>T', ':Git push -u origin ', { desc = '[T]rack branch' })
      end,
    })

    if not require('util').has 'noice' then
      vim.api.nvim_create_autocmd('BufLeave', {
        group = augroup,
        pattern = '*',
        callback = function()
          if vim.bo.ft ~= 'fugitive' then
            return
          end
          vim.cmd [[set cmdheight=0]] -- revert cmdheight on leave
        end,
      })
    end
  end,
}
