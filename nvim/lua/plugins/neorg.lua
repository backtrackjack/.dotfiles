-- note: on macos run `cc=/usr/bin/gcc nvim -c "tsinstallsync norg"` to sync parsers
return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  event = "VimEnter",
  opts = {
    load = {
      ["core.defaults"] = {}, -- loads default behaviour
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            keybinds.unmap("norg", "n", "nt")
          end,
        }
      },
      ["core.export"] = {},
      ["core.concealer"] = {
        config = {
          icon_preset = "varied",
          dim_code_blocks = {
            enabled = true,
            padding = { left = 1 },
          },
        },
      }, -- adds pretty icons to your documents
      ["core.dirman"] = { -- manages neorg workspaces
        config = {
          workspaces = {
            notes = "~/.dotfiles/neorg/notes",
            work = "~/.dotfiles/neorg/work",
          },
          default_workspace = "notes",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}
