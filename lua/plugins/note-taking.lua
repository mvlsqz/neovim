return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  cmd = "Neorg",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "folke/zen-mode.nvim",
      opts = {
        window = {
          options = {
            relativenumber = false,
            number = false,
          },
        },
        plugins = {
          wezterm = {
            enabled = true,
            font = "+5",
          },
        },
      },
    },
    {
      "lukas-reineke/headlines.nvim",
      opts = {},
    },
  },
  keys = require("configs.keys").neorg,
  config = require("configs.config").neorg,
}
