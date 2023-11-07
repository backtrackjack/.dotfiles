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
  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'williamboman/mason-lspconfig.nvim', dependencies = 'williamboman/mason.nvim' },
      'b0o/schemastore.nvim',
      'folke/noice.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require 'lsp-zero'
      local lspconfig = require 'lspconfig'

      lsp_zero.extend_lspconfig()

      -- Sign configuration
      lsp_zero.set_sign_icons {
        error = '',
        warn = '',
        hint = '',
        info = '',
      }

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        vim.keymap.set('n', '<Leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Line [d]iagnostic info', buffer = bufnr })
        vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = 'Go to [d]efinition', buffer = bufnr })
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = '[a]ction', buffer = bufnr })
        vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, { desc = 'Go to [i]mplementation', buffer = bufnr })
        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'Go to [r]eference(s)', buffer = bufnr })
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
        vim.keymap.set('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[r]ename', buffer = bufnr })
      end)

      require('mason-lspconfig').setup {
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup, -- auto configure new language servers

          -- lua
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,

          -- php
          intelephense = function()
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
          end,

          phpactor = function()
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
          end,

          -- Vue, JavaScript, TypeScript
          volar = function()
            lspconfig.volar.setup {
              on_init = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
              end,
              -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
              -- This drastically improves the responsiveness of diagnostic updates on change
              filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
            }
          end,

          -- JSON
          jsonls = function()
            lspconfig.jsonls.setup {
              settings = {
                json = {
                  schemas = require('schemastore').json.schemas(),
                  validate = { enable = true },
                },
              },
            }
          end,

          -- YAML
          yamlls = function()
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
          end,
        },
      }

      -- Diagnostic configuration
      vim.diagnostic.config {
        virtual_text = false,
        float = {
          source = true,
        },
      }
    end,
  },
}
