return {
  'folke/trouble.nvim',
  cmd = { 'TroubleToggle', 'Trouble' },
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      '<leader>xx',
      '<cmd>TroubleToggle document_diagnostics<cr>',
      desc = 'Document Diagnosti[x] (Trouble)'
    },
    {
      '<leader>xX',
      '<cmd>TroubleToggle workspace_diagnostics<cr>',
      desc = 'Workspace Diagnosti[X] (Trouble)'
    },
    {
      '<leader>xL',
      '<cmd>TroubleToggle loclist<cr>',
      desc = '[L]ocation List (Trouble)'
    },
    {
      '<leader>xQ',
      '<cmd>TroubleToggle quickfix<cr>',
      desc = '[Q]uickfix List (Trouble)'
    },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').previous { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous trouble/[q]uickfix item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next trouble/[q]uickfix item',
    },
  },
}
