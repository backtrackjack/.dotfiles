return {
  'epwalsh/obsidian.nvim',
  cmd = { 'ObsidianQuickSwitch' }, -- used in alpha dashboard
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/.dotfiles/notes/vaults/main/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/.dotfiles/notes/vaults/main/**.md',
    'BufWinEnter ' .. vim.fn.expand '~' .. '/.dotfiles/notes/vaults/main/**.md',
  },
  keys = {
    { '<leader>nf', '<cmd>ObsidianQuickSwitch<cr>', desc = '[f]ind note' },
    { '<leader>ns', '<cmd>ObsidianSearch<cr>', desc = '[s]earch' },
    { '<leader>nn', ':ObsidianNew ', desc = '[n]ew' },
    { '<leader>nd', '<cmd>ObsidianToday<cr>', desc = '[d]aily' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    completion = {
      nvim_cmp = true,
    },
    workspaces = {
      {
        name = 'main',
        path = '~/.dotfiles/notes/vaults/main',
      },
    },
    daily_notes = {
      folder = 'dailies',
      date_format = '%d-%m-%Y',
    },
    note_id_func = function(title)
      local suffix = ''
      if title ~= nil then
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end,
    log_level = vim.log.levels.ERROR,
    follow_url_func = function(url)
      -- Open url with system default browser or url handler
      vim.fn.jobstart { 'open', url } -- macos
    end,
    open_app_foreground = true,
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true, desc = '[f]ollow link / go to [f]ile' },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true, desc = 'toggle [ch]eckbox' },
      },
      ['<leader>nb'] = {
        action = function()
          return vim.cmd 'ObsidianBacklinks'
        end,
        opts = { buffer = true, desc = '[b]acklinks' },
      },
      ['<leader>no'] = {
        action = function()
          return vim.cmd 'ObsidianOpen'
        end,
        opts = { buffer = true, desc = '[o]pen in obsidian' },
      },
    }, -- Optional, configure additional syntax highlighting / extmarks.
  },
  -- config = function(_, opts)
  --   local obs = require 'obsidian'
  --   obs.setup(opts)
  --
  --   local function map(mode, lhs, rhs, options)
  --     options = options or {}
  --     options.silent = options.silent ~= false
  --     options.noremap = options.noremap ~= false
  --     options.expr = options.expr ~= true
  --     options.buffer = options.buffer ~= true
  --     vim.keymap.set(mode, lhs, rhs, options)
  --   end
  --
  --   vim.api.nvim_create_autocmd('BufWinEnter', {
  --     group = vim.api.nvim_create_augroup('Obsidian_test', { clear = true }),
  --     pattern = vim.fn.expand '~' .. '/.dotfiles/notes/vaults/main/**.md',
  --     callback = function()
  --       map('n', '<leader>nb', '<cmd>ObsidianBacklinks<cr>', { desc = '[b]acklinks' })
  --       map('n', 'gf', function()
  --         require('obsidian').util.gf_passthrough()
  --       end, { desc = '[f]ollow link / go to [f]ile' })
  --       map('n', '<leader>ch', function()
  --         require('obsidian').util.toggle_checkbox()
  --       end, { desc = 'toggle [ch]eckbox' })
  --     end,
  --   })
  -- end,
}
