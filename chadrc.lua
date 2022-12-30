local M = {}
require "custom.neovide"
-- require "custom.highlights"
local overrides = require "custom.plugins.overrides"

M.ui = {
  theme = "rosepine",
  theme_toggle = { "catppuccin", "rosepine" },
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
