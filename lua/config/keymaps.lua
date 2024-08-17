-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

wk.add({
  { "<leader>p", group = "Pane" },
  { "<leader>ph", "<cmd>vertical resize +5<cr>", desc = "Increase Pane Height" },
  { "<leader>pj", "<cmd>resize -5<cr>", desc = "Reduce Pane Width" },
  { "<leader>pk", "<cmd>resize +5<cr>", desc = "Increase Pane Width" },
  { "<leader>pl", "<cmd>vertical resize -5<cr>", desc = "reduce Pane Height" },
}, {})
