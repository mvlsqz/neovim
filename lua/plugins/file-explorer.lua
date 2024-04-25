return {
  { -- File Explorer
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    config = function()
      require("oil").setup()
    end,
    keys = {

      {
        "<leader>fe",
        function()
          local fe = require("oil")
          if vim.bo.filetype == "oil" then
            fe.close()
          else
            fe.open_float()
          end
        end,
        desc = "Opens File Explorer",
      },
    },
  },
}
