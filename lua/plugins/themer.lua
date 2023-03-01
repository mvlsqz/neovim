return {
  {
    "themercorp/themer.lua",
    opts = {},
    config = function()
      require("themer").setup({
        dim_inactive = true,
        term_colors = true,
        styles = {
          comment = { style = "italic" },
        },
      })
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function(_, opts)
      local monokai = require("monokai-pro")

      monokai.setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        italic_comments = true,
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        day_night = {
          enable = false,
          day_filter = "classic",
          night_filter = "octagon",
        },
        inc_search = "background", -- underline | background
        background_clear = {},
        plugins = {
          bufferline = {
            underline_selected = true,
            underline_visible = true,
            bold = false,
          },
          indent_blankline = {
            context_highlight = "pro", -- default | pro
            context_start_underline = true,
          },
        },
        override = function(c)
          return {
            -- Mine
            DashboardRecent = { fg = c.base.magenta },
            DashboardProject = { fg = c.base.blue },
            DashboardConfiguration = { fg = c.base.white },
            DashboardSession = { fg = c.base.green },
            DashboardLazy = { fg = c.base.cyan },
            DashboardServer = { fg = c.base.yellow },
            DashboardQuit = { fg = c.base.red },
            SLMode = {
              bold = true,
            },
          }
        end,
      })
      monokai.load()
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
