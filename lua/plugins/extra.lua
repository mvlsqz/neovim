return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    keys = require("configs.keys").barbecue,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup({
        theme = "tokionight",
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    cmd = "ToggleTerm",
    keys = require("configs.keys").toggleterm,
    opts = require("configs.options").toggleterm,
  },
}
