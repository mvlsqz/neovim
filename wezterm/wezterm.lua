local wezterm = require("wezterm")
local config = wezterm.config_builder()
local colors = require("colors").get_color_scheme()

local function font_with_fallback(name, params)
  local names = {
    {
      family = name,
      harfbuzz_features = {
        "calt",
        "liga",
        "dlig",
        "ss01",
        "ss02",
        "ss03",
        "ss04",
        "ss05",
        "ss06",
        "ss07",
        "ss08",
      },
    },
    "JetBrainsMono Nerd Font",
    "Noto Emoji",
    "Apple Color Emoji",
  }
  return wezterm.font_with_fallback(names, params)
end
local font_name = "Monaspace Argon Var"

wezterm.log_info("reloading")

require("tabs").setup(config)
require("mouse").setup(config)
require("links").setup(config)
-- require("keys").setup(config)

config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.front_end = "OpenGL"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.window_decorations = "RESIZE"

-- Fonts
config.font_size = 19
config.font = font_with_fallback(font_name)
config.bold_brightens_ansi_colors = true
config.font_rules = {
  {
    italic = false,
    intensity = "Normal",
    font = font_with_fallback("Monaspace Neon Var", { weight = "Regular" }),
  },
  {
    intensity = "Bold",
    font = font_with_fallback("Monaspace Krypton Var", { weight = "ExtraBold" }),
  },
  {
    italic = true,
    font = font_with_fallback("Monaspace Radon", { weight = "ExtraLight", italic = true }),
  },
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 20, right = 20, top = 20, bottom = 0 }
config.scrollback_lines = 10000
config.colors = colors

-- Command Palette
config.command_palette_font_size = 13
config.command_palette_bg_color = colors.cursor_fg
config.command_palette_fg_color = colors.ansi[7]
config.audible_bell = "Disabled"
config.send_composed_key_when_right_alt_is_pressed = false

return config
