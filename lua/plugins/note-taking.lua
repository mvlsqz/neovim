local home = os.getenv("HOME")
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
  },
  keys = require("configs.keys").neorg,
  config = require("configs.config").neorg,
}
