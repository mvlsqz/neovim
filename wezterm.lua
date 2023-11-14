local wezterm = require("wezterm")
local user_configs = require("user_configs")

local function font_with_fallback(name, params)
  local names = {
    {
      family = name,
      harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
    },
    "JetBrainsMono Nerd Font",
    "Noto Emoji",
    "Apple Color Emoji",
  }
  return wezterm.font_with_fallback(names, params)
end

local font_name = "Monaspace Argon"

return {
  -- OpenGL for GPU acceleration, Software for CPU
  front_end = "OpenGL",
  window_decorations = "RESIZE",
  font = font_with_fallback(font_name),
  -- NOTE: -> Font Rules Mix and Match ->
  font_rules = {
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
  },
  warn_about_missing_glyphs = false,
  font_size = 22,
  line_height = 1.0,

  -- Cursor style
  default_cursor_style = "BlinkingUnderline",

  -- X11
  enable_wayland = false,

  -- Keybinds
  disable_default_key_bindings = true,
  keys = user_configs.keys,

  -- Tokyo Night Colorscheme
  bold_brightens_ansi_colors = true,
  colors = {
    foreground = "#c0caf5",
    background = "#1a1b26",
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    cursor_fg = "#1a1b26",
    selection_bg = "#283457",
    selection_fg = "#c0caf5",
    scrollbar_thumb = "#edeff0",
    split = "#090909",
    ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
    brights = { "#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5" },
    indexed = { [136] = "#edeff0" },
    tab_bar = {
      inactive_tab_edge = "#16161e",
      background = "#191b28",
      active_tab = { fg_color = "#7aa2f7", bg_color = "#1a1b26", italic = true },
      inactive_tab = { bg_color = "#16161e", fg_color = "#545c7e" },
      inactive_tab_hover = { bg_color = "#16161e", fg_color = "#7aa2f7" },
      new_tab_hover = { fg_color = "#16161e", bg_color = "#7aa2f7" },
      new_tab = { fg_color = "#7aa2f7", bg_color = "#191b28" },
    },
  },

  -- Padding
  window_padding = {
    left = 25,
    right = 25,
    top = 25,
    bottom = 15,
  },

  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  -- window_background_opacity = 0.98,
  window_close_confirmation = "NeverPrompt",
  window_frame = { active_titlebar_bg = "#090909", font = font_with_fallback(font_name, { bold = true }) },
}
