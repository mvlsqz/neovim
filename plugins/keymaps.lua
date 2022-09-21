local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
return {
  -- Visual --
  -- stay in indent mode
  keymap("v", "<", "<gv", opts),
  keymap("v", ">", ">gv", opts),

  -- Move text up and down
  keymap("v", "<A-j>", ":m .+1<CR>==", opts),
  keymap("v", "<A-k>", ":m .-2<CR>==", opts),
  keymap("v", "p", '"_dP', opts),

  -- Visual Block --
  -- Move text up and down
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts),
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts),
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts),
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts),

  -- -- Terminal --
  -- -- Terminal navigation
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts),
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts),
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts),
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts),

  vim = {
    n = {
      ["<leader>wq"] = { "<cmd>qa <CR>", "Quit Nvim" },
      ["<leader>gg"] = { "<cmd>LazyGit<CR>", "Lazygit" },
      ["<leader>fe"] = { "<cmd>Telescope file_browser<CR>", "File Browser" },
    },
  },
}
