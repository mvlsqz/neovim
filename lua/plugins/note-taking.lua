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
  keys = {
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
      "gox",
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
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.summary"] = {},
        ["core.autocommands"] = {},
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.concealer"] = {
          config = {
            icon_preset = "basic",
            icons = {
              code_block = {
                conceal = true,
                content_only = true,
                padding = {
                  left = 5,
                  right = 5,
                },
                width = "fullwidth",
              },
            },
          },
        },
        ["core.export"] = {},
        ["core.ui.calendar"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = home .. "/Documents/notes",
              knowledge = home .. "/Documents/knowledge",
            },
            default_workspace = "notes",
          },
        },
      },
    })

    vim.wo.foldlevel = 10
    vim.wo.conceallevel = 3
    vim.wo.number = false
    vim.wo.cole = 1
    vim.wo.foldenable = true
    vim.wo.signcolumn = "yes:2"
    vim.wo.relativenumber = true
    vim.wo.number = false
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
}
