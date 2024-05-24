return {
  {
    -- Scape from insert mode
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mapping = { "jk", "jj", "JJ", "JK" },
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
