return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  lazy = true,
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format()
      end,
      mode = { 'n', 'v' },
      desc = 'Format File',
    },
  },
  opts = function()
    ---@class ConformOpts
    local opts = {
      -- LazyVim will use these options when formatting with the conform.nvim formatter
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        php = { 'pint' },
        blade = { 'blade-formatter' },
        markdown = { 'prettierd' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        css = { 'prettierd' },
        yaml = { 'prettierd' },
        vue = { 'prettierd' },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        pint = function(bufnr)
          return { command = require('conform.util').find_executable({
            './vendor/bin/pint',
          }, 'pint') }
        end,
      },
    }
    return opts
  end,
}
