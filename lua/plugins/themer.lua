return {
  {
    "themercorp/themer.lua",
    opts = {},
    config = function()
      require("themer").setup({
        dim_inactive = true,
        term_colors = true,
        styles = {
          comment = { style = "italic" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "themer_sonokai_deep",
    },
  },
}
