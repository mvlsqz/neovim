return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["q"] = "actions.close",
        ["H"] = "actions.parent",
        ["L"] = "actions.select",
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "<leader>fe", require("oil").toggle_float, { desc = "Open file explorer" })
  end,
}
