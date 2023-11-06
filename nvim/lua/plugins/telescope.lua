return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      'nvim-tree/nvim-web-devicons',
      'airblade/vim-rooter',
    },
    cmd = { 'Telescope' },
    keys = {
      {
        '<leader>/',
        function()
          require('telescope.builtin').live_grep {
            additional_args = { '--fixed-strings' },
            cwd = vim.fn.FindRootDirectory(),
          }
        end,
        desc = 'Grep everything',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.FindRootDirectory(),
            no_ignore = true,
          }
        end,
        desc = '[f]ind files',
      },
      {
        '<leader>fF',
        function()
          require('telescope.builtin').find_files {
            cwd = vim.fn.FindRootDirectory(),
            hidden = true,
            no_ignore = true,
          }
        end,
        desc = '[F]ind files more harder like',
      },
      {
        '<leader>ba',
        '<cmd>Telescope buffers<cr>',
        desc = '[a]ctive',
      },
      -- search
      {
        '<leader>sa',
        '<cmd>Telescope autocommands<cr>',
        desc = '[a]utocommands',
      },
      {
        '<leader>sb',
        '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        desc = 'in [b]uffer',
      },
      {
        '<leader>sc',
        '<cmd>Telescope commands<cr>',
        desc = '[c]ommands',
      },
      {
        '<leader>sd',
        '<cmd>Telescope diagnostics bufnr=0<cr>',
        desc = '[d]iagnostics',
      },
      {
        '<leader>sD',
        '<cmd>Telescope diagnostics<cr>',
        desc = 'all of the [D]iagnostics',
      },
      {
        '<leader>ss',
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = '[s]ymbols',
      },
      {
        '<leader>sh',
        '<cmd>Telescope help_tags<cr>',
        desc = '[h]elp pages',
      },
      {
        '<leader>sH',
        '<cmd>Telescope highlights<cr>',
        desc = '[H]ighlight groups',
      },
      {
        '<leader>sk',
        '<cmd>Telescope keymaps<cr>',
        desc = '[k]eymaps',
      },
      {
        '<leader>sM',
        '<cmd>Telescope man_pages<cr>',
        desc = '[M]an pages',
      },
      {
        '<leader>snh',
        function()
          require('telescope').extensions.notify.notify()
        end,
        desc = '[h]istory',
      },
      -- ui
      {
        '<leader>uC',
        function()
          require('telescope.builtin').colorscheme { enable_preview = true }
        end,
        desc = '[C]olorscheme picker with preview',
      },
    },
    config = function()
      local actions = require 'telescope.actions'

      require('telescope').setup {
        defaults = {
          path_display = { truncate = 1 },
          prompt_prefix = '   ',
          selection_caret = '  ',
          layout_config = {
            prompt_position = 'top',
          },
          preview = {
            timeout = 200,
          },
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<C-Down>'] = actions.cycle_history_next,
              ['<C-Up>'] = actions.cycle_history_prev,
            },
          },
          file_ignore_patterns = { '.git/' },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          buffers = {
            previewer = false,
            layout_config = {
              width = 80,
            },
          },
          oldfiles = {
            prompt_title = 'History',
          },
          lsp_references = {
            previewer = false,
          },
          lsp_definitions = {
            previewer = false,
          },
          lsp_document_symbols = {
            symbol_width = 55,
          },
        },
      }

      require('telescope').load_extension 'fzf'
    end,
  },
}
