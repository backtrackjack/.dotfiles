return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.vim_markdown_no_default_key_mappings = 1
  end,
}
