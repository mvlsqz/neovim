return {
  {
    "telescope.nvim",
    opts = {
      defaults = {
        borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
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
    },
  },
  {
    "neo-tree.nvim",
    enabled = false,
  },
}
