return {
  { 'wakatime/vim-wakatime' }, -- time tracking
  {
    'whatyouhide/vim-textobj-xmlattr',
    dependencies = 'kana/vim-textobj-user',
  }, -- Text objects for HTML attributes
  {
    'tpope/vim-fugitive',
    dependencies = 'tommcdo/vim-fubitive',
    keys = { { mode = { 'n' }, '<leader>gg', vim.cmd.Git } },
  }, -- GIT
  { 'jwalton512/vim-blade' }, -- blade support
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  {
    'github/copilot.vim',
    config = function()
      vim.cmd([[
        imap <silent><script><expr> <c-y> copilot#Accept("\<cr>")
        let g:copilot_no_tab_map = v:true
      ]])
    end
  }, -- taking our jobs
  {
    'folke/trouble.nvim',
    init = function()
      vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { noremap = true, silent = true, desc = 'TroubleToggle' })
    end,
  }, -- diagnostics in quickfix list
}
