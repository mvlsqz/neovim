return {
  {
    "neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    cond = vim.fn.executable("make") == 1,
  },
  dependencies = {
    "telescope.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      { "<leader>fe", "<cmd>Telescope file_browser<CR>", desc = "File Explorer" },
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
}
