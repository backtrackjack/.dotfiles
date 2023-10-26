return {
  'echasnovski/mini.hipatterns',
  opts = function()
    local hi = require 'mini.hipatterns'
    return {
      -- custom LazyVim option to enable the tailwind integration
      tailwind = {
        enabled = true,
        ft = {
          'blade',
          'css',
          'html',
          'javascript',
          'javascriptreact',
          'php',
          'typescript',
          'typescriptreact',
        },
        style = 'full',
      },
      highlighters = {
        hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
      },
    }
  end,
}
