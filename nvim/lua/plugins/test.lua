return {
  "vim-test/vim-test",
  keys = {
    {"<Leader>tn", ":TestNearest<CR>", desc = "Test Nearest"},
    {"<Leader>tf", ":TestFile<CR>", desc = "Test File"},
    {"<Leader>ts", ":TestSuite<CR>", desc = "Test Suite"},
    {"<Leader>tl", ":TestLast<CR>", desc = "Test Last"},
    {"<Leader>tv", ":TestVisit<CR>", desc = "Test Visit"}
  },
  config = function()
    vim.cmd([[let test#strategy = "neovim"]])
  end,
}
