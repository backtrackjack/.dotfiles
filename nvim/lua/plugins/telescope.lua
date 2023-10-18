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
      'kyazdani42/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    cmd = { 'Telescope' },
    keys = {
      { '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Telescope live_grep' },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files { no_ignore = true, prompt_title = 'All Files' }
        end,
        desc = 'find files',
      },
      {
        '<leader>fF',
        ":lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<cr>",
        desc = 'like REALLY find files',
      },
      {
        '<leader>b',
        '<cmd>Telescope buffers<cr>',
        desc = 'list active buffers',
      },
      -- search
      {
        '<leader>sa',
        '<cmd>Telescope autocommands<cr>',
        desc = 'autocommands',
      },
      {
        '<leader>sb',
        '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        desc = 'current buffer fuzzy find',
      },
      {
        '<leader>sc',
        '<cmd>Telescope commands<cr>',
        desc = 'commands',
      },
      {
        '<leader>sd',
        '<cmd>Telescope diagnostics bufnr=0<cr>',
        desc = 'document diagnostics',
      },
      {
        '<leader>sD',
        '<cmd>Telescope diagnostics<cr>',
        desc = 'workspace diagnostics',
      },
      {
        '<leader>sh',
        '<cmd>Telescope help_tags<cr>',
        desc = 'help pages',
      },
      {
        '<leader>sH',
        '<cmd>Telescope highlights<cr>',
        desc = 'highlight groups',
      },
      {
        '<leader>sk',
        '<cmd>Telescope keymaps<cr>',
        desc = 'keymaps',
      },
      {
        '<leader>sM',
        '<cmd>Telescope man_pages<cr>',
        desc = 'man pages',
      },
      -- ui
      {
        '<leader>uC',
        function()
          require('telescope.builtin').colorscheme { enable_preview = true }
        end,
        desc = 'colorscheme picker with preview',
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
        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                ['<C-k>'] = require('telescope-live-grep-args.actions').quote_prompt(),
                ['<C-i>'] = require('telescope-live-grep-args.actions').quote_prompt { postfix = ' --iglob ' },
              },
            },
          },
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
