return {
  enabled = true,
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      indicator = {
        style = "underline",
      },
      diagnastics = "nvim_lsp",
      show_close_icon = false,
      tab_size = 0,
      max_name_length = 25,
      offsets = {
        {
          filetype = "neo-tree",
          text = "  Files",
          highlight = "Directory",
          text_align = "left",
        },
      },
      separator_style = "slant",
      custom_areas = {
        left = function()
          return {
            { text = "    ", fg = "#8fff6d" },
          }
        end,
      },
    },
  },
}
