K = {}
K.oil = {
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
}

K.treesitter = {
  { "<c-space>", desc = "Increment selection" },
  { "<bs>", desc = "Decrement selection", mode = "x" },
}

return K
