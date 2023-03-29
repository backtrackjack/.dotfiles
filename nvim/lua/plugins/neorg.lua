-- note: on macos run `cc=/usr/bin/gcc nvim -c "tsinstallsync norg"` to sync parsers
return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- loads default behaviour
      ["core.export"] = {},
      ["core.norg.concealer"] = {
        config = {
          icon_preset = "varied",
          dim_code_blocks = {
            enabled = true,
            padding = { left = 1 },
          }
        }
      }, -- adds pretty icons to your documents
      ["core.norg.dirman"] = { -- manages neorg workspaces
        config = {
          workspaces = {
            notes = "~/.dotfiles/neorg/notes",
            work = "~/.dotfiles/neorg/work",
          },
          default_workspace = "notes",
        },
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      }
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}
