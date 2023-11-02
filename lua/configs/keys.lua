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

K.barbecue = {
  {
    "]b",
    function()
      vim.cmd("bnext")
    end,
    desc = "Jump to next buffer",
  },
  {
    "[b",
    function()
      vim.cmd("bprevious")
    end,
    desc = "Jump to previous buffer",
  },
}

K.toggleterm = {
  {
    "<leader>h",
    function()
      vim.cmd("ToggleTerm")
    end,
    desc = "Toggle float terminal",
  },
}

K.marks = function()
  local marks = require("marks")
  return {
    {
      "<leader>ma",
      function()
        marks.annotate()
      end,
      desc = "Add mark annotation",
    },
  }
end

K.mind = {
  {
    "gmm",
    function()
      vim.cmd("MindOpenMain")
    end,
    desc = "Open Mind Main Notes",
  },
  {
    "gmc",
    function()
      vim.cmd("MindClose")
    end,
    desc = "Close Mind Main Notes",
  },
  {
    "gmr",
    function()
      vim.cmd("Neorg return")
    end,
    desc = "Close Notes",
  },
}

return K
