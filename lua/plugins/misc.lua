return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {},
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
          filetypes = {
            theme = "ivy",
          },
        },
      })

      require("telescope").load_extension("fzf")
    end,
  },
  {
    -- Escape from insert mode
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        timeout = vim.o.timeoutlen,
        default_mappings = true,
        mappings = {
          i = {
            j = {
              k = "<Esc>",
              j = "<Esc>",
            },
            J = {
              J = "<Esc>",
            },
          },
          t = {
            j = {
              k = "<Esc>",
              j = "<Esc>",
            },
          },
        },
      })
    end,
  },
  {
    "jrop/jq.nvim",
    config = function()
      return true
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  { -- Mark manipulation
    "chentoast/marks.nvim",
    config = function()
      local marks = require("marks")
      marks.setup({})
    end,
    keys = function()
      local marks = require("marks")
      return {
        {
          "<leader>ma",
          function()
            marks.annotate()
          end,
          desc = "Add mark annotation",
        },
      }
    end,
  },
}
