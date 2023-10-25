return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
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
        'lua-language-server',
        'marksman',
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
        'xmlformatter',
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
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require 'cmp'

      cmp.setup {
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
          ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'williamboman/mason-lspconfig.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require 'lsp-zero'
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        vim.keymap.set('n', '<Leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Line [d]iagnostic info' })
        vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous [d]iagnostic' })
        vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next [d]iagnostic' })
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Go to [d]efinition' })
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = '[a]ction' })
        vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { desc = 'Go to [i]mplementation' })
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { desc = 'Go to [r]eference(s)' })
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
        vim.keymap.set('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[r]ename' })
      end)

      require('mason-lspconfig').setup {
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup, -- auto configure new language servers
        },
      }

      -- more specific lsp config
      local lspconfig = require 'lspconfig'

      -- lua
      lspconfig.lua_ls.setup {
        on_attach = function()
          require('lspconfig').lua_ls.setup { lsp_zero.nvim_lua_ls() }
        end,
      }

      -- PHP
      lspconfig.intelephense.setup {
        commands = {
          IntelephenseIndex = {
            function()
              vim.lsp.buf.execute_command { command = 'intelephense.index.workspace' }
            end,
          },
        },
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }

      lspconfig.phpactor.setup {
        on_init = function(client)
          client.server_capabilities.completionProvider = false
          client.server_capabilities.hoverProvider = false
          client.server_capabilities.implementationProvider = false
          client.server_capabilities.referencesProvider = false
          client.server_capabilities.renameProvider = false
          client.server_capabilities.selectionRangeProvider = false
          client.server_capabilities.signatureHelpProvider = false
          client.server_capabilities.typeDefinitionProvider = false
          client.server_capabilities.workspaceSymbolProvider = false
          client.server_capabilities.definitionProvider = false
          client.server_capabilities.documentHighlightProvider = false
          client.server_capabilities.documentSymbolProvider = false
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        init_options = {
          ['language_server_phpstan.enabled'] = false,
          ['language_server_psalm.enabled'] = false,
        },
        handlers = {
          ['textDocument/publishDiagnostics'] = function() end,
        },
      }

      -- Vue, JavaScript, TypeScript
      lspconfig.volar.setup {
        on_init = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
        -- This drastically improves the responsiveness of diagnostic updates on change
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      }

      -- JSON
      lspconfig.jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
          },
        },
      }

      -- YAML
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      }

      -- Diagnostic configuration
      vim.diagnostic.config {
        virtual_text = false,
        float = {
          source = true,
        },
      }

      -- Sign configuration
      vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
    end,
  },
}
