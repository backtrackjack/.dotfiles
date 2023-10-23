return {
    {
        'echasnovski/mini.clue',
        version = '*',
        init = function()
            local miniclue = require('mini.clue')
            miniclue.setup({
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
                },
                clues = {
                    { mode = 'n', keys = '<leader>f', desc = 'Find' },
                    { mode = 'n', keys = '<leader>s', desc = 'Search' },
                    { mode = 'n', keys = '<leader>g', desc = 'Git' },
                    { mode = 'n', keys = '<leader>c', desc = 'Code' },
                    { mode = 'n', keys = '<leader>u', desc = 'UI' },
                    { mode = 'n', keys = '<leader>m', desc = 'MAKE IT' },
                    { mode = 'n', keys = '<leader>p', desc = 'Phpactor' },
                    { mode = 'n', keys = '<leader>t', desc = 'Test' },
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),
                },
                window = {
                    config = {
                        width = 'auto'
                    },
                    delay = 300
                }
            })
        end
    },
}
