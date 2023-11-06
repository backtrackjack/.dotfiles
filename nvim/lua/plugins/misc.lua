return {
  { 'wakatime/vim-wakatime' }, -- time tracking
  { 'tpope/vim-sleuth' }, -- auto detect indentation
  { 'monaqa/dial.nvim' }, -- increment/decrement numbers}
  { 'LunarVim/bigfile.nvim' }, -- better performance on big files
  {
    'whatyouhide/vim-textobj-xmlattr', -- Text objects for HTML attributes
    dependencies = 'kana/vim-textobj-user',
  },
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
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = true,
  },
  {
    'simrat39/symbols-outline.nvim', -- outline symbols in file
    keys = {
      { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = '[s]ymbols outline' },
    },
    config = true,
  },
  {
    'lukas-reineke/headlines.nvim', -- pretty headings
    ft = { 'markdown' },
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },
}
