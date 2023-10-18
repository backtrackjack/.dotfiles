return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  keys = {
    { ']h', ':Gitsigns next_hunk<cr>' },
    { '[h', ':Gitsigns prev_hunk<cr>' },
    { '<leader>gs', ':Gitsigns stage_hunk<cr>' },
    { '<leader>gS', ':Gitsigns undo_stage_hunk<cr>' },
    { '<leader>gp', ':Gitsigns preview_hunk<cr>' },
    { '<leader>gb', ':Gitsigns blame_line<cr>' },
  },
  opts = {
    signs = {
      add = { text = '⢕' },
      change = { text = '⢕' },
    },
  },
}
