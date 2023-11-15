return {
  'epwalsh/obsidian.nvim',
  cmd = { 'ObsidianToday' }, -- used in alpha dashboard
  event = {
    'BufReadPre ~/.dotfiles/notes/vaults/main/**.md',
    'BufNewFile ~/.dotfiles/notes/vaults/main/**.md',
  },
  keys = {
    { '<leader>nf', '<cmd>ObsidianQuickSwitch<cr>', desc = '[f]ind note' },
    { '<leader>ns', '<cmd>ObsidianSearch<cr>', desc = '[s]earch' },
    { '<leader>no', '<cmd>ObsidianOpen<cr>', desc = '[o]pen in obsidian' },
    { '<leader>nn', ':ObsidianNew ', desc = '[n]ew' },
    { '<leader>nd', '<cmd>ObsidianToday<cr>', desc = '[d]aily' },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
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
    },
  },
  -- config = function(_, opts)
  --   local obs = require 'obsidian'
  --   obs.setup(opts)

  -- local function map(mode, lhs, rhs, options)
  --   options = options or {}
  --   options.silent = options.silent ~= false
  --   options.noremap = options.noremap ~= false
  --   options.expr = options.expr ~= true
  --   vim.keymap.set(mode, lhs, rhs, options)
  -- end
  --
  -- vim.api.nvim_create_autocmd('BufWinEnter', {
  --   group = vim.api.nvim_create_augroup('Obsidian', { clear = true }),
  --   pattern = '*.md',
  --   callback = function()
  --     map('n', 'gf', function()
  --       if obs.util.cursor_on_markdown_link() then
  --         return '<cmd>ObsidianFollowLink<cr>'
  --       else
  --         return 'gf'
  --       end
  --     end, { desc = '[f]ollow link / go to [f]ile' })
  --
  --     map('n', '<leader>nb', '<cmd>ObsidianBacklinks<cr>', { desc = '[b]acklinks' })
  --     map('n', '<leader>ch', function()
  --       require('obsidian').util.toggle_checkbox()
  --     end, { desc = 'toggle [c]heckbox' })
  --   end,
  -- })
  -- end,
}
