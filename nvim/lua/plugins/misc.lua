return {
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-sleuth' }, -- auto detect indentation
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  { 'monaqa/dial.nvim' }, -- increment/decrement numbers
  { 'airblade/vim-rooter' },
  {
    'whatyouhide/vim-textobj-xmlattr', -- Text objects for HTML attributes
    dependencies = 'kana/vim-textobj-user',
  },
  {
    'github/copilot.vim', -- taking your jobs
    config = function()
      vim.keymap.set('i', '<c-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    'chrishrb/gx.nvim', -- go to URL under cursor
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
}
