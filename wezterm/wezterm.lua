local wezterm = require("wezterm")
local colors = require("custom_colors").colors
local user_configs = require("user_configs")
local my_colorscheme = colors.primeppuccin

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

local font_name = "Monaspace Argon"

wezterm.on("user-var-changed", function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

return {
  unix_domains = {
    {
      name = "unix",
    },
  },
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
  font_size = user_configs.font_size,
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
  -- color_scheme = "Catppuccin Latte",
  colors = {
    foreground = my_colorscheme.text,
    background = my_colorscheme.base,
    cursor_bg = my_colorscheme.rosewater,
    cursor_border = my_colorscheme.rosewater,
    cursor_fg = my_colorscheme.crust,
    selection_bg = my_colorscheme.surface2,
    selection_fg = my_colorscheme.text,
    scrollbar_thumb = my_colorscheme.surface2,
    split = my_colorscheme.overlay0,
    ansi = {
      my_colorscheme.subtext1,
      my_colorscheme.red,
      my_colorscheme.green,
      my_colorscheme.yellow,
      my_colorscheme.blue,
      my_colorscheme.pink,
      my_colorscheme.teal,
      my_colorscheme.surface2,
    },
    brights = {
      my_colorscheme.subtext0,
      my_colorscheme.red,
      my_colorscheme.green,
      my_colorscheme.yellow,
      my_colorscheme.blue,
      my_colorscheme.pink,
      my_colorscheme.teal,
      my_colorscheme.surface1,
    },
    indexed = { [16] = my_colorscheme.peach, [17] = my_colorscheme.rosewater },
    tab_bar = {
      active_tab = {
        bg_color = my_colorscheme.sapphire,
        fg_color = my_colorscheme.crust,
      },
      background = my_colorscheme.crust,
      inactive_tab = {
        bg_color = my_colorscheme.mantle,
        fg_color = my_colorscheme.text,
      },
      inactive_tab_edge = my_colorscheme.surface0,
      inactive_tab_hover = {
        bg_color = my_colorscheme.base,
        fg_color = my_colorscheme.text,
      },
      new_tab = {
        fg_color = my_colorscheme.surface0,
        bg_color = my_colorscheme.text,
      },
      new_tab_hover = {
        fg_color = my_colorscheme.surface1,
        bg_color = my_colorscheme.text,
      },
    },
  },

  -- Padding
  window_padding = {
    left = 25,
    right = 25,
    top = 25,
    bottom = 0,
  },

  -- Tab Bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
  tab_bar_at_bottom = true,

  -- General
  automatically_reload_config = true,
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
  window_background_opacity = 0.98,
  window_close_confirmation = "NeverPrompt",
  window_frame = {
    active_titlebar_bg = my_colorscheme.base,
    font = font_with_fallback(font_name, { bold = true }),
  },
}
