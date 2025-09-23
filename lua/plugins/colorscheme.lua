local scheme_config = require("mvlsqz")
local flavour = scheme_config.colorscheme_flavour()
local daytime = scheme_config.daytime()

if daytime ~= "day" then
  vim.opt.bg = "dark"
end

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = daytime,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
