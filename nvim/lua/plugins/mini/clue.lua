return {
  {
    'echasnovski/mini.clue',
    version = '*',
    init = function()
      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },

          { mode = 'n', keys = ']'},
          { mode = 'n', keys = '['}
        },
        clues = {
          { mode = 'n', keys = '<leader>c', desc = '+[c]ode' },
          { mode = 'n', keys = '<leader>f', desc = '+[f]ile' },
          { mode = 'n', keys = '<leader>g', desc = '+[g]it' },
          { mode = 'n', keys = '<leader>l', desc = '+[l]azy' },
          { mode = 'n', keys = '<leader>m', desc = '+[m]AKE IT' },
          { mode = 'n', keys = '<leader>n', desc = '+[n]otes' },
          { mode = 'n', keys = '<leader>s', desc = '+[s]earch' },
          { mode = 'n', keys = '<leader>t', desc = '+[t]est' },
          { mode = 'n', keys = '<leader>u', desc = '+[u]I' },
          { mode = 'n', keys = '<leader>w', desc = '+[w]indow' },
          { mode = 'n', keys = '<leader>x', desc = '+quickfi[x]' },
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
        },
        window = {
          config = {
            width = 'auto',
          },
          delay = 300,
        },
      }
    end,
  },
}
