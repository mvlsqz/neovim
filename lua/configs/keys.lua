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

K.neorg = {
  {
    "go/",
    function()
      vim.cmd("Neorg journal")
    end,
    desc = "Goto notes index",
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
    "gon",
    function()
      vim.cmd("Neorg keybind norg core.dirman.new.note")
    end,
    desc = "Write New note",
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
    "gow",
    function()
      vim.cmd("Neorg workspace")
    end,
    desc = "Switch to default workspace",
  },
  {
    "gol",
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
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        display_name = "LazyGit",
        cmd = "lazygit",
        dir = os.getenv("HOME") .. "/Documents/notes",
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "curved",
        },
        on_close = function()
          vim.cmd("startinsert!")
        end,
        winbar = {
          enabled = true,
          name_formatter = function(terminal)
            return terminal.name
          end,
        },
      })
      lazygit:toggle()
    end,
  },
}

return K
