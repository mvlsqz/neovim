local keymap = vim.keymap.set

keymap({ "n", "i", "v", "t" }, "<F1>", "<ESC>", { desc = "Disabling the F1 key", silent = true })

keymap("t", "<C-h>", function()
  vim.cmd("wincmd r")
end, { desc = "Focus window on the left" })
keymap("t", "<C-l>", function()
  vim.cmd("wincmd l")
end, { desc = "Focus window on the left" })
keymap("t", "<C-j>", function()
  vim.cmd("wincmd j")
end, { desc = "Focus window on the left" })
keymap("t", "<C-k>", function()
  vim.cmd("wincmd k")
end, { desc = "Focus window on the left" })

keymap("t", "jj", [[<C-\><C-n>]], { desc = "Leave insert mode in terminal" })

keymap("x", "<leader>p", '"_dP', { desc = "Better text paste" })
