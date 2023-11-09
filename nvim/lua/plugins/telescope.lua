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
    },
    cmd = { 'Telescope' },
    keys = {
      {
        '<leader>sG',
        function()
          require('telescope.builtin').live_grep {
            additional_args = { '--fixed-strings' },
            cwd = require('util').find_git_root(),
            prompt_title = 'Grep the whole dang project',
          }
        end,
        desc = '[G]rep the whole dang project',
      },
      {
        '<leader>sg',
        function()
          require('telescope.builtin').live_grep {
            additional_args = { '--fixed-strings' },
            prompt_title = 'Grep from just here',
          }
        end,
        desc = '[g]rep from just here',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').git_files {
            show_untracked = true,
          }
        end,
        desc = '[f]ind files',
      },
      {
        '<leader>fF',
        function()
          require('telescope.builtin').find_files {
            hidden = true,
            no_ignore = true,
            prompt_title = '[F]ind files (current dir)',
          }
        end,
        desc = 'REALLY [F]IND files',
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
        '<leader>sm',
        function()
          require('telescope').extensions.notify.notify()
        end,
        desc = '[m]essages',
      },
      {
        '<leader>sr',
        function()
          require('telescope.builtin').resume()
        end,
        desc = '[r]esume',
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
              ['<Down>'] = actions.cycle_history_next,
              ['<Up>'] = actions.cycle_history_prev,
            },
          },
          file_ignore_patterns = { '.git/' },
        },
        pickers = {
          buffers = {
            previewer = false,
            layout_config = {
              width = 80,
            },
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
