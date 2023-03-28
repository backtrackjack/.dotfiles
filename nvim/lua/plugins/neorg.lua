-- note: on macos run `cc=/usr/bin/gcc nvim -c "tsinstallsync norg"` to sync parsers
return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- loads default behaviour
      ["core.norg.concealer"] = {}, -- adds pretty icons to your documents
      ["core.norg.dirman"] = { -- manages neorg workspaces
        config = {
          workspaces = {
            notes = "~/.dotfiles/neorg/notes",
            work = "~/.dotfiles/neorg/work",
          },
          default_workspace = "notes",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
}
