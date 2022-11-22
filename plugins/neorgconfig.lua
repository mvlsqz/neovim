local present, neorg = pcall(require, "neorg")
local icons = require "custom.plugins.icons"

if not present then
  return
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { "norg" },
  highlight = {
    enable = true,
  },
}

local options = {
  load = {
    ["core.defaults"] = {},
    ["core.presenter"] = {
      config = { zen_mode = "truezen" },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.export"] = {
      config = {
        directory = "~/Documents/",
        filetype = "markdown",
      },
    },
    ["core.tangle"] = {},
    ["external.kanban"] = {},
    ["external.gtd-project-tags"] = {},
    ["core.gtd.ui"] = {},
    ["core.gtd.helpers"] = {},
    ["core.gtd.queries"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "work",
      },
    },
    ["core.norg.concealer"] = {
      config = {
        markup_preset = "concealer",
        icons_preset = "diamond",
        icons = {
          marker = {
            enabled = true,
            icon = " ",
          },
          todo = icons.todo,
          list = icons.list,
          heading = icons.heading,
        },
      },
    },
    ["core.norg.qol.toc"] = {},
    ["core.export.markdown"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/Documents/work",
          home = "~/Documents/home",
        },
      },
    },
  },
}

neorg.setup(options)
