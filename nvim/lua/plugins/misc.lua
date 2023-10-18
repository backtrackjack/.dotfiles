return {
  {
    "swekaj/php-foldexpr.vim",
    config = function()
      vim.g.phpfold_use = 1
    end,
  },
  {
    "folke/noice.nvim",
    opts = {
      hover = {
        silent = true,
      },
    },
    enabled = function()
      if vim.g.neovide then
        return false
      end
      return true
    end,
  },
}
