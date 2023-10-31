return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = { "LazyFile", "VeryLazy" },
    version = "*",
    keys = require("configs.keys").barbecue,
    dependencies = {
      {
        "SmiteshP/nvim-navic",
        lazy = true,
        init = function()
          vim.g.navic_silence = true
          require("lazyvim.util").lsp.on_attach(function(client, buffer)
            if client.supports_method("textDocument/documentSymbol") then
              require("nvim-navic").attach(client, buffer)
            end
          end)
        end,
        opts = function()
          return {
            separator = " ",
            highlight = true,
            depth_limit = 5,
            icons = require("lazyvim.config").icons.kinds,
            lazy_update_context = true,
          }
        end,
      },
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
