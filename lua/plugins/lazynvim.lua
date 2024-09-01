local colorscheme = require("plugins.colorscheme")
return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "catppuccin",
    -- colorscheme = function()
    --   require("tokyonight").load()
    -- end,
  },
}
