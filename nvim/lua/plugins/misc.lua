return {
  {
    "folke/noice.nvim",
    enabled = function()
      if vim.g.neovide then
        return false
      end
      return true
    end,
  },
}
