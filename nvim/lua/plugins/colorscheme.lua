return {
  'catppuccin/nvim',
  opts = {
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = true,
      illuminate = true,
      lsp_trouble = true,
      mason = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
      navic = { enabled = true, custom_bg = 'lualine' },
      noice = true,
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
    },
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd [[colorscheme catppuccin]]
  end,
}
