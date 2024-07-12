-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

wk.register({
  p = {
    name = "Pane",
    k = { "<cmd>resize +5<cr>", "Increase Pane Width" },
    j = { "<cmd>resize -5<cr>", "Reduce Pane Width" },
    h = { "<cmd>vertical resize +5<cr>", "Increase Pane Height" },
    l = { "<cmd>vertical resize -5<cr>", "reduce Pane Height" },
  },
}, { prefix = "<leader>" })
