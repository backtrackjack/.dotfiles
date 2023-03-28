return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require('neogen').setup{
      snippet_engine = 'luasnip',
    }
  end
}
