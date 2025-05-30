-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local wk = require("which-key")

wk.add({
  { "<leader>p", group = "Pane", icon = "󱂬 " },
  { "<leader>ph", "<cmd>vertical resize +5<cr>", desc = "Increase Pane Height" },
  { "<leader>pj", "<cmd>resize -5<cr>", desc = "Reduce Pane Width" },
  { "<leader>pk", "<cmd>resize +5<cr>", desc = "Increase Pane Width" },
  { "<leader>pl", "<cmd>vertical resize -5<cr>", desc = "reduce Pane Height" },
}, {})

wk.add({
  { "<leader>o", group = "Obsidian", icon = "󰙏 " },
  { "<leader>of", "<cmd>ObsidianNewFromTemplate<cr>", desc = "New from template" },
  { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
  { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
  { "<leader>ot", "<cmd>ObsidianTags<cr>", desc = "Tags" },
  { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Today Note" },
  { "<leader>om", "<cmd>ObsidianTomorrow<cr>", desc = "Note for Tomorrow" },
  { "<leader>ow", "<cmd>ObsidianWorkspace<cr>", desc = "Switch workspace" },
  { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Today Note" },
}, {})

vim.keymap.set("n", "<F1>", "<Esc>", { silent = true })
vim.keymap.set("i", "<F1>", "<Esc>", { silent = true })
