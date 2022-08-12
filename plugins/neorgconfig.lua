local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
local present, neorg = pcall(require, "neorg")
local icons = require "custom.plugins.icons"

if not present then
  return
end

require("nvim-treesitter.configs").setup {
  ensure_installed = { "norg_meta", "norg_table" },
  highlight = {
    enable = true,
  },
}

local options = {
  load = {
    ["core.defaults"] = {},
    ["core.export"] = {
      config = {
        directory = "~/Documents/",
        filetype = "markdown",
      },
    },
    ["core.tangle"] = {},
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
        icons = {
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
