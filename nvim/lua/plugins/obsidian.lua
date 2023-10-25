return {
  'epwalsh/obsidian.nvim',
  lazy = false,
  keys = {
    { '<leader>np', '<cmd>ObsidianWorkspace personal<cr>', desc = 'set [p]ersonal workspace' },
    { '<leader>nw', '<cmd>ObsidianWorkspace work<cr>', desc = 'set [w]ork workspace' },
    { '<leader>nf', '<cmd>ObsidianQuickSwitch<cr>', desc = '[f]ind note' },
    { '<leader>ns', '<cmd>ObsidianSearch<cr>', desc = '[s]earch' },
    { '<leader>no', '<cmd>ObsidianOpen<cr>', desc = '[o]pen in obsidian' },
    { '<leader>nn', ':ObsidianNew ', desc = '[n]ew' },
    { '<leader>nt', '<cmd>ObsidianToday<cr>', desc = '[t]oday' },
    { '<leader>ny', '<cmd>ObsidianYesterday<cr>', desc = '[y]esterday' },
    { '<leader>nb', '<cmd>ObsidianBacklinks<cr>', desc = '[b]acklinks' },
    { 'gl', '<cmd>ObsidianLinkNew<cr>', desc = '[l]ink selection to new note' },
    { 'gL', '<cmd>ObsidianLink<cr>', desc = '[L]ink selection to existing note' },
  },
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'preservim/vim-markdown',
  },
  opts = {
    completion = {
      nvim_cmp = true,
    },
    workspaces = {
      {
        name = 'personal',
        path = '~/.dotfiles/obsidian/vaults/personal',
      },
      {
        name = 'work',
        path = '~/.dotfiles/obsidian/vaults/work',
      },
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
    -- Optional, key mappings.
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = true, expr = true, buffer = true },
      },
    },
    log_level = vim.log.levels.ERROR,
    follow_url_func = function(url)
      -- Open url with system default browser or url handler
      vim.fn.jobstart { 'open', url } -- macos
    end,
    open_app_foreground = true,
  },
  init = function()
    vim.g.vim_markdown_frontmatter = 1
  end,
  config = function(_, opts)
    local obs = require 'obsidian'
    obs.setup(opts)
    vim.keymap.set('n', 'gf', function()
      if require('obsidian').util.cursor_on_markdown_link() then
        return '<cmd>ObsidianFollowLink<CR>'
      else
        return 'gf'
      end
    end, { noremap = false, expr = true })
  end,
}
