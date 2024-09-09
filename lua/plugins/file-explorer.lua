return {
  {
    "tamago324/lir.nvim",
    dependencies = {
      "tamago324/lir-git-status.nvim",
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      local actions = require("lir.actions")
      local mark_actions = require("lir.mark.actions")
      local clipboard_actions = require("lir.clipboard.actions")

      require("lir.git_status").setup({})
      require("lir").setup({
        show_hidden_files = true,
        ignore = {},
        devicons = {
          enable = true,
          highlight_dirname = true,
        },

        mappings = {
          ["l"] = actions.edit,
          ["<cr>"] = actions.edit,
          ["<C-x>"] = actions.split,
          ["<C-v>"] = actions.vsplit,
          ["<C-t>"] = actions.tabedit,

          ["h"] = actions.up,
          ["q"] = actions.quit,

          ["M"] = actions.mkdir,
          ["N"] = actions.newfile,
          ["R"] = actions.rename,
          ["@"] = actions.cd,
          ["Y"] = actions.yank_path,
          ["."] = actions.toggle_show_hidden,
          ["D"] = actions.delete,

          ["J"] = function()
            mark_actions.toggle_mark("n")
            vim.cmd("normal! j")
          end,
          ["C"] = clipboard_actions.copy,
          ["X"] = clipboard_actions.cut,
          ["P"] = clipboard_actions.paste,
        },
        float = {
          winblend = 0,
          curdir_window = {
            enable = true,
            highlight_dirname = true,
          },
        },
        hide_cursor = true,
      })
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "lir" },
        callback = function()
          vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
          )
        end,
      })
    end,
    keys = {
      {
        "<leader>fe",
        function()
          local fe = require("lir.float")
          if vim.bo.filetype == "lir" then
            fe.toggle()
          else
            fe.init()
          end
        end,
        desc = "Opens File Explorer",
      },
    },
  },
}
