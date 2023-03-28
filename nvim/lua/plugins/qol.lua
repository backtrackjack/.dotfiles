return {
  -- try use ctrl-c instead
  -- {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup({
  --       mapping = { "jk", "kj" },
  --       keys = function()
  --         return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<esc>l" or "<esc>"
  --       end,
  --     })
  --   end,
  -- },

  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "tommcdo/vim-lion",
    config = function()
      vim.g.lion_squeeze_spaces = 1
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    version = false,
    config = function()
      require("mini.splitjoin").setup()
    end,
  },

  { "whatyouhide/vim-textobj-xmlattr", lazy = false, dependencies = { "kana/vim-textobj-user" } },

  { "mbbill/undotree" },

  { "RishabhRD/nvim-cheat.sh", dependencies = { "RishabhRD/popfix" } },

  { "tpope/vim-sleuth", event = "VeryLazy" }, -- smart indentation

  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
  }, -- supposed to let you navigate tmux panes same as in nvim

  { "sickill/vim-pasta" }, -- smart formatting on paste

  {
    "preservim/vim-markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
}
