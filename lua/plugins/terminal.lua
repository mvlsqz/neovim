return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
    keys = {
      { "<leader>ut", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
  },
}
