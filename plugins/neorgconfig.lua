local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
local present, neorg = pcall(require, "neorg")
local icons = require("custom.plugins.icons")

if not present then
  return
end

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  }
}

parser_configs.norg_table = {
  install_info = {
      url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
      files = { "src/parser.c" },
      branch = "main"
  },
}

require('nvim-treesitter.configs').setup{
  ensure_installed = {"norg_meta", "norg_table"},
  highlight = {
      enable = true,
  },
}

local options = {
  load = {
    ["core.defaults"] = {},
    ["core.export"] = {},
    ["core.tangle"] = {},
    ["core.gtd.ui"] = {},
    ["core.gtd.helpers"] = {},
    ["core.gtd.queries"] = {},
    ["core.gtd.base"] = {
      config = {
        workspace = "work"
      }
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          todo = icons.todo,
          list = icons.list,
          heading = icons.heading,
        }
      }
    },
    ["core.norg.qol.toc"] = {},
    ["core.export.markdown"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/Documents/work",
          home = "~/Documents/home"
        }
      }
    }
  }
}

neorg.setup(options)
