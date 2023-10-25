return {
  'epwalsh/obsidian.nvim',
  cmd = {
    'ObsidianLink',
    'ObsidianLinkNew',
    'ObsidianBacklinks',
    'ObsidianYesterday',
    'ObsidianToday',
    'ObsidianNew',
    'ObsidianOpen',
    'ObsidianSearch',
    'ObsidianQuickSwitch',
    'ObsidianWorkspace',
  },
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
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/JSObsidian/**.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/JSObsidian/**.md',
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
      return tostring(os.time()) .. "-" .. suffix
    end,
    finder = 'fzf-lua',
    -- Optional, key mappings.
    mappings = {
      -- Overrides the 'gx' mapping to work on markdown/wiki links within your vault.
      ['gx'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
    overwrite_mappings = true, -- blocks annoying conflict error with mini/clue.lua
    follow_url_func = function(url)
      -- Open url with system default browser or url handler
      vim.fn.jobstart { 'open', url } -- macos
    end,
  },
  config = function(_, opts)
    require('obsidian').setup(opts)

    vim.g.vim_markdown_frontmatter = 1
  end,
}
