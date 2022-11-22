if not vim.fn.exists "g:neovide" then
  return
end
local g = vim.g
local o = vim.opt

-- g.neovide_fullscreen = true
g.neovide_remember_window_size = true
g.neovide_hide_mouse_when_typing = true
g.neovide_no_idle = false
g.neovide_profiler = false
g.neovide_touch_drag_timeout = 0.1
g.neovide_cursor_animation_length = 0.1
g.neovide_cursor_trail_length = 0.1
g.neovide_cursor_unfocused_outline_width = 0.1
g.neovide_cursor_antialiasing = false
g.neovide_scale_factor = 4
g.neovide_cursor_vfx_mode = "torpedo"
g.neovide_cursor_vfx_opacity = 200.0
g.neovide_cursor_vfx_particle_lifetime = 1.2
g.neovide_transparency = 0.96

g.gui_font_default_size = 4
g.gui_font_size = vim.g.gui_font_default_size
g.gui_font_face = "Iosevka"

RefreshGuiFont = function()
  o.guifont = string.format("%s:h%s", g.gui_font_face, g.gui_font_size)
end

ResizeGuiFont = function(delta)
  g.gui_font_size = g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  g.gui_font_size = g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()
