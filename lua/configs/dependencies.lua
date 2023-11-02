D = {}

D.treesitter = {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = require("configs.config").tstextobjects,
  },
}

D.mind = {
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
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
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
                },
              },
            },
          },
          ["core.export"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Documents/notes",
                knowledge = "~/Documents/knowledge",
              },
              default_workspace = "notes",
            },
          },
        },
      })

      vim.wo.foldlevel = 10
      vim.wo.conceallevel = 2
      vim.wo.number = false
      vim.wo.cole = 1
      vim.wo.foldenable = true
      vim.wo.signcolumn = "yes:2"
      vim.wo.relativenumber = true
      vim.wo.number = false
      vim.wo.wrap = true
      vim.wo.linebreak = true
    end,
  },
}

return D
