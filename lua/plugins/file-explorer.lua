return {
  -- {
  --   "stevearc/oil.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("oil").setup({
  --       columns = { "icon" },
  --       keymaps = {
  --         ["q"] = "actions.close",
  --         ["H"] = "actions.parent",
  --         ["L"] = "actions.select",
  --       },
  --       view_options = {
  --         show_hidden = true,
  --       },
  --     })
  --
  --     vim.keymap.set("n", "<leader>fe", function()
  --       vim.cmd("vsplit | Oil")
  --     end, { desc = "Open file explorer" })
  --   end,
  -- },
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        preview = {
          layout = "vertical",
        },
      },
    },
  },
  {
    "echasnovski/mini.files",
    opts = {
      use_as_default_explorer = true,
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "-",
        mark_goto = "'",
        mark_set = "m",
        reset = "<BS>",
        reveal_cwd = "@",
        show_help = "g?",
        synchronize = "=",
        trim_left = "<",
        trim_right = ">",
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("mini.files").open(vim.loop.cwd())
        end,
        desc = "Open file explorer",
      },
    },
  },
}
