local M = {}
local overrides = require "custom.plugins.overrides"

M.ui = {
  theme = "ayu-dark",
  hl_add = require("custom.highlights").new_hlgroups,
  hl_override = require("custom.highlights").new_overriden_hlgroups,
  theme_toggle = { "catppuccin", "ayu-dark" },
}

M.mappings = require "custom.plugins.keymaps"

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
    ["williamboman/mason.nvim"] = overrides.mason,
  },
}

return M
