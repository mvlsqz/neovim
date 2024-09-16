return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
    opts = {
      context = 20,
    },
  },
  opts = {
    plugins = {
      wezterm = {
        enabled = true,
        font = "+4",
      },
    },
  },
}
