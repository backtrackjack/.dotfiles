return {
  'williamboman/mason.nvim',
  cmd = 'Mason',
  build = ':MasonUpdate',
  lazy = false,
  opts = {
    ensure_installed = {
      'blade-formatter',
      'html-lsp',
      'intelephense',
      'jq',
      'json-lsp',
      'jsonlint',
      'lua-language-server',
      'phpactor',
      'pint',
      'prettierd',
      'rust-analyzer',
      'shfmt',
      'solargraph',
      'stylua',
      'tailwindcss-language-server',
      'typescript-language-server',
      'vue-language-server',
      'woke',
      'write-good',
      'xmlformatter',
      'yamllint',
    },
  },
  config = function(_, opts)
    require('mason').setup(opts)
    local mr = require 'mason-registry'
    mr:on('package:install:success', function()
      vim.defer_fn(function()
        -- trigger FileType event to possibly load this newly installed LSP server
        require('lazy.core.handler.event').trigger {
          event = 'FileType',
          buf = vim.api.nvim_get_current_buf(),
        }
      end, 100)
    end)
    local function ensure_installed()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
