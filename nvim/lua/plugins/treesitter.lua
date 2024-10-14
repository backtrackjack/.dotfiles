return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = function()
    require('nvim-treesitter.install').update { with_sync = true }
  end,
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      opts = {
        custom_calculation = function(node, language_tree)
          if vim.bo.filetype == 'blade' then
            return '{{-- %s --}}'
          end
        end,
      },
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
  },
  main = { 'nvim-treesitter.configs' },
  opts = {
    ensure_installed = {
      'arduino',
      'bash',
      'comment',
      'css',
      'diff',
      'dockerfile',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'html',
      'http',
      'ini',
      'javascript',
      'json',
      'jsonc',
      'lua',
      'make',
      'markdown',
      'passwd',
      'php',
      'phpdoc',
      'python',
      'regex',
      'ruby',
      'rust',
      'sql',
      'svelte',
      'typescript',
      'vim',
      'vue',
      'xml',
      'yaml',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'markdown' },
    },
    indent = {
      enable = true,
      disable = { 'yaml' },
    },
    rainbow = {
      enable = true,
    },
    textsubjects = {
      enable = true,
      keymaps = {
        ['<cr>'] = 'textsubjects-smart',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
          ['ac'] = '@comment.outer',
          ['ic'] = '@comment.inner',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }
    vim.filetype.add {
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    }
  end,
}
