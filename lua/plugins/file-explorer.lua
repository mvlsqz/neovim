return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["q"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>fe", require("oil").toggle_float, { desc = "open parent directory" })
  end,
}
