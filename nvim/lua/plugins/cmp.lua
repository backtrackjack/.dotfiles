-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'VonHeikemen/lsp-zero.nvim',
  },
  config = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require 'lsp-zero'
    lsp_zero.extend_cmp()

    require('luasnip.loaders.from_vscode').lazy_load()

    -- And you can configure cmp even more, if you want to.
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
      formatting = lsp_zero.cmp_format(),
      mapping = cmp.mapping.preset.insert {
        ['<c-n>'] = cmp.mapping(function(fallback)
          -- print('tab...')
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<c-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<c-y>'] = cmp.mapping.confirm { select = false },
      },
      experimental = {
        ghost_text = true,
      },
    }
  end,
}
