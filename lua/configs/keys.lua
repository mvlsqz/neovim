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

K.neorg = {
  {
    "goj",
    function()
      vim.cmd("Neorg journal")
    end,
    desc = "Open journal",
  },
  {
    "goi",
    function()
      vim.cmd("Neorg index")
    end,
    desc = "Goto notes index",
  },
  {
    "goc",
    function()
      vim.cmd("Neorg return")
    end,
    desc = "Close Notes",
  },
  {
    "gow",
    function()
      vim.cmd("Neorg keybind norg core.dirman.new.note")
    end,
    desc = "Write new note",
  },
  {
    "gon",
    function()
      vim.cmd("Neorg workspace notes")
    end,
    desc = "Switch to workspace notes",
  },
  {
    "gom",
    function()
      vim.cmd("Neorg inject-metadata")
    end,
    desc = "Insert document metadata",
  },
  {
    "gos",
    function()
      vim.cmd("Neorg generate-workspace-summary")
    end,
    desc = "Create/Update workspace summary",
  },
  {
    "gok",
    function()
      vim.cmd("Neorg workspace knowledge")
    end,
    desc = "Switch to knowledge workspace",
  },
  {
    "got",
    function()
      vim.cmd("Neorg toc right")
    end,
    desc = "Open Neorg table of contents",
  },
  {
    "gog",
    function()
      local utils = require("lazyvim.util")
      utils.terminal("lazygit", { cwd = os.getenv("HOME") .. "/Documents/notes/", esc_esc = false })
    end,
    desc = "Save notes to git",
  },
}

return K
