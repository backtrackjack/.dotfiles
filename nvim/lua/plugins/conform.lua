return {
  'stevearc/conform.nvim',
  dependencies = { 'mason.nvim' },
  event = { 'VeryLazy' },
  cmd = 'ConformInfo',
  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format({ async = true }, function(err)
          if not err then
            local mode = vim.api.nvim_get_mode().mode
            if vim.startswith(string.lower(mode), 'v') then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', true)
            end
          end
        end)
      end,
      mode = { 'n', 'v' },
      desc = 'Format File',
    },
    {
      '<leader>cF',
      function()
        require('conform').format { formatters = { 'injected' } }
      end,
      mode = { 'n', 'v' },
      desc = '[F]ormat injected langs',
    },
  },
  opts = function()
    local opts = {
      format = {
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        sh = { 'shfmt' },
        zsh = { 'shfmt' },
        php = { 'pint' },
        blade = { 'blade-formatter' },
        markdown = { 'prettierd' },
        javascript = { 'biome' },
        typescript = { 'biome' },
        json = { 'biome' },
        css = { 'prettierd' },
        yaml = { 'prettierd' },
        vue = { 'prettierd' },
        sql = { 'sqlfmt' },
        python = { 'black' },
      },
      -- The options you set here will be merged with the builtin formatters.
      -- You can also define any custom formatters here.
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
