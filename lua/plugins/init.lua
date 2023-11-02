require("lazyvim.config").init()

-- Load configs module
local m = require("configs")

-- Each configs table
local configs = m.config

-- Each kemaps table
local keys = m.keys

-- Each options table
local options = m.options

-- Each dependencies table
local dependencies = m.dependencies

Plugins = {
  { -- Global configs
    "LazyVim/LazyVim",
    opts = options.lazyvim,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  { -- File Explorer
    "stevearc/oil.nvim",
    config = configs.oil,
    keys = keys.oil,
  },
  { -- Syntax Parser
    "nvim-treesitter/nvim-treesitter",
    event = { "LazyFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    init = function(plugin)
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,

    dependencies = dependencies.treesitter,
    keys = keys.treesitter,
    config = configs.treesitter,
  },
  { -- Theme/Color Scheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = options.theme,
    config = configs.theme,
  },
  { -- Language Server Protocol
    "neovim/nvim-lspconfig",
    opts = options.lsp,
  },
  { -- Formatters
    "stevearc/conform.nvim",
    opts = options.conform,
  },
  { -- Scape from insert mode
    "max397574/better-escape.nvim",
    config = configs.betterscape,
  },
  { -- Mark manipulation
    "chentoast/marks.nvim",
    config = configs.marks,
    keys = keys.marks,
  },
}

return Plugins
