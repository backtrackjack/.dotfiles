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
        '<leader>/',
        function()
          require('telescope.builtin').live_grep {
            additional_args = { '--fixed-strings' }
          }
        end,
        desc = 'Grep everything',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').git_files { no_ignore = true, prompt_title = 'All Files' }
        end,
        desc = '[f]ind files',
      },
      {
        '<leader>fF',
        ":lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<cr>",
        desc = '[F]ind files more harder',
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
