return {
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-sleuth' }, -- auto detect indentation
  {
    'airblade/vim-rooter', -- detect root directory of project
    init = function()
      vim.g.rooter_manual_only = 1
      vim.g.rooter_patterns = { '.git', 'composer.json' }
    end,
    config = function()
      vim.cmd 'Rooter'
    end,
  },
  {
    'whatyouhide/vim-textobj-xmlattr', -- Text objects for HTML attributes
    dependencies = 'kana/vim-textobj-user',
  },
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
    'chrishrb/gx.nvim', -- go to url under cursor
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
}
