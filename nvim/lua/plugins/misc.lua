return {
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-sleuth' }, -- auto detect indentation
  {
    'whatyouhide/vim-textobj-xmlattr', -- Text objects for HTML attributes
    dependencies = 'kana/vim-textobj-user',
  },
  {
    'tpope/vim-fugitive', -- GIT
    dependencies = {
      'tommcdo/vim-fubitive',
      'tpope/vim-rhubarb',
    },
    cmd = { 'GBrowse', 'G' },
    keys = {
      { mode = { 'n' }, '<leader>gg', vim.cmd.Git, desc = 'Open fugitive' },
    },
  },
  { 'jwalton512/vim-blade' }, -- blade support
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  {
    'github/copilot.vim', -- taking our jobs
    config = function()
      vim.cmd [[
        imap <silent><script><expr> <c-y> copilot#Accept("\<cr>")
        let g:copilot_no_tab_map = v:true
      ]]
    end,
  },
  {
    'folke/trouble.nvim', -- diagnostics in quickfix list
    init = function()
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true, desc = 'TroubleToggle' })
    end,
  },
  {
    'chrishrb/gx.nvim', -- go to url under cursor
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
}
