return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      autoformat = false,
      servers = {
        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascript", "typescript", "vue", "blade" },
          ignore_filetypes = { "php" }, -- Add this line to ignore PHP files
        },
        intelephense = {
          filetypes = { "php" },
          ignore_filetypes = { "blade" },
          on_attach = function(client, bufnr)
            local filetypes = { "php", "blade" }
            if vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentFormattingRangeProvider = false
              vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
            end
          end,
        },
      },
    },
  },
  {
    "sheerun/vim-polyglot",
  },
}
