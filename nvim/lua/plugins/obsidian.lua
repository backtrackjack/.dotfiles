return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  keys = {
    { '<leader>nf', '<cmd>ObsidianQuickSwitch<cr>', desc = '[f]ind note' },
    { '<leader>ns', '<cmd>ObsidianSearch<cr>', desc = '[s]earch' },
    { '<leader>no', '<cmd>ObsidianOpen<cr>', desc = '[o]pen in obsidian' },
    { '<leader>nn', ':ObsidianNew ', desc = '[n]ew' },
    { '<leader>nd', '<cmd>ObsidianToday<cr>', desc = '[d]aily' },
    { '<leader>nb', '<cmd>ObsidianBacklinks<cr>', desc = '[b]acklinks' },
    { 'gl', '<cmd>ObsidianLinkNew<cr>', desc = '[l]ink selection to new note' },
    { 'gL', '<cmd>ObsidianLink<cr>', desc = '[L]ink selection to existing note' },
  },
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
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
    finder = 'fzf-lua',
    log_level = vim.log.levels.ERROR,
    follow_url_func = function(url)
      -- Open url with system default browser or url handler
      vim.fn.jobstart { 'open', url } -- macos
    end,
    open_app_foreground = true,
  },
  config = function(_, opts)
    local obs = require 'obsidian'
    opts.mappings = {
      ['gf'] = {
        action = function()
          return obs.util.gf_passthrough()
        end,
        opts = {
          noremap = false,
          expr = true,
          buffer = true,
          desc = 'follow link',
        },
      },
    }
    obs.setup(opts)
  end,
}
