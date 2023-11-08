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
    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = vim.api.nvim_create_augroup('Fugitive', { clear = true }),
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        vim.cmd[[set cmdheight=1]] -- to avoid extra key press on some actions see: https://www.reddit.com/r/neovim/comments/tturkx/can_i_automatically_hide_press_enter_or_type/

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = vim.api.nvim_get_current_buf()
          opts.remap = false
          opts.silent = opts.silent ~= false
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- pull
        map('n', '<leader>P', ':Git push<cr>', { desc = '[P]ush' })

        -- rebase always
        map('n', '<leader>p', ':Git pull --rebase<cr>', { desc = '[p]ull' })

        -- track branch
        map('n', '<leader>T', ':Git push -u origin ', { desc = '[T]rack branch' })
      end,
    })
  end,
}
