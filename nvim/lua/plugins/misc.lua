return {
  {
    'numToStr/Comment.nvim',
    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = false,
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  }, -- comment stuff
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-sleuth' }, -- auto detect indentation
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  { 'monaqa/dial.nvim' }, -- increment/decrement numbers
  -- { 'airblade/vim-rooter' },
  {
    'whatyouhide/vim-textobj-xmlattr', -- Text objects for HTML attributes
    dependencies = 'kana/vim-textobj-user',
  },
  {
    'github/copilot.vim', -- taking your jobs
    config = function()
      vim.cmd [[
        imap <silent><script><expr> <C-Y> copilot#Accept("\<cr>")
        let g:copilot_no_tab_map = v:true
      ]]
    end,
  },
  {
    'chrishrb/gx.nvim', -- go to URL under cursor
    keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
}
