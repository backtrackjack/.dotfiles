return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- PHP
    require('lspconfig').intelephense.setup {
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command { command = 'intelephense.index.workspace' }
          end,
        },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
    }

    require('lspconfig').phpactor.setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
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
    require('lspconfig').volar.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
      -- Enable "Take Over Mode" where volar will provide all JS/TS LSP services
      -- This drastically improves the responsiveness of diagnostic updates on change
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    }

    -- Tailwind CSS
    require('lspconfig').tailwindcss.setup { capabilities = capabilities }

    -- JSON
    require('lspconfig').jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    }

    -- YAML
    require('lspconfig').yamlls.setup {
      capabilities = capabilities,
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

    --  Ruby
    require('lspconfig').solargraph.setup { capabilities = capabilities }

    -- Lua
    require('lspconfig').lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
      capabilities = capabilities,
    }

    -- Markdown
    require('lspconfig').marksman.setup { capabilities = capabilities }

    -- Keymaps
    vim.keymap.set('n', '<Leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Line [d]iagnostic info' })
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { desc = 'Previous [d]iagnostic' })
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', { desc = 'Next [d]iagnostic' })
    vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Go to [d]efinition' })
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = '[a]ction' })
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', { desc = 'Go to [i]mplementation' })
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', { desc = 'Go to [r]eference(s)' })
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    vim.keymap.set('n', '<Leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = '[r]ename' })

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
}
