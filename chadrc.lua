local M = {}
require "custom.neovide"
require "custom.highlights"
local overrides = require "custom.plugins.overrides"

M.ui = {
  theme = "ayu-dark",
  theme_toggle = { "catppuccin", "ayu-dark" },
}

M.mappings = require "custom.plugins.keymaps"

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
    ["williamboman/mason.nvim"] = overrides.mason,
    ["NvChad/ui"] = overrides.chadui,
  },
}

return M
