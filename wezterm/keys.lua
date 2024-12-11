local wezterm = require("wezterm")

local act = wezterm.action
local M = {}

M.mod = "ALT|CTRL"
M.alt_mod = "ALT|SHIFT"

M.smart_split = wezterm.action_callback(function(window, pane)
  local dim = pane:get_dimensions()
  if dim.pixel_height > dim.pixel_width then
    window:perform_action(act.SplitVertical({ domain = "CurrentPaneDomain" }), pane)
  else
    window:perform_action(act.SplitHorizontal({ domain = "CurrentPaneDomain" }), pane)
  end
end)

function M.setup(config)
  config.disable_default_key_bindings = true
  config.keys = {
    {
      key = ".",
      mods = M.mod,
      action = wezterm.action_callback(function(window, pane)
        local choices = {
          {
            label = "DevLikePassword",
          },
          {
            label = "ProdLikePassword",
          },
        }

        window:perform_action(
          act.InputSelector({
            action = wezterm.action_callback(function(_, pane0, id, label)
              if not id and not label then
                wezterm.log_info("cancelled")
              else
                local _, stdout, _ = wezterm.run_child_process({
                  "security",
                  "find-generic-password",
                  "-w",
                  "-a",
                  label,
                })
                pane0:send_text(stdout)
              end
            end),
            title = "Select Password",
            choices = choices,
            alphabet = "123456789",
            description = "Write the number you want to choose or press / to search.",
          }),
          pane
        )
      end),
    },
    { mods = M.mod, key = "k", action = act.ScrollByPage(-0.5) },
    { mods = M.mod, key = "j", action = act.ScrollByPage(0.5) },
    -- New Tab
    { mods = M.mod, key = "t", action = act({ SpawnCommandInNewTab = { cwd = wezterm.home_dir } }) },
    -- Splits
    { mods = M.mod, key = "Enter", action = M.smart_split },
    { mods = M.alt_mod, key = "|", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { mods = M.mod, key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { mods = M.alt_mod, key = "<", action = act.DecreaseFontSize },
    { mods = M.alt_mod, key = ">", action = act.IncreaseFontSize },
    -- Move Tabs
    { mods = M.mod, key = "LeftArrow", action = act.MoveTabRelative(1) },
    { mods = M.mod, key = "RightArrow", action = act.MoveTabRelative(-1) },
    -- { mods = M.mod, key = "l", action = act({ ActivateTabRelative = 1 }) },
    { mods = M.mod, key = "h", action = act({ ActivateTabRelative = -1 }) },
    { mods = M.mod, key = "R", action = wezterm.action.RotatePanes("Clockwise") },
    { mods = M.mod, key = "s", action = wezterm.action.PaneSelect({}) },
    -- Clipboard
    { mods = "SUPER", key = "c", action = act.CopyTo("Clipboard") },
    { mods = M.mod, key = "Space", action = act.QuickSelect },
    { mods = M.mod, key = "X", action = act.ActivateCopyMode },
    { mods = M.mod, key = "f", action = act.Search("CurrentSelectionOrEmptyString") },
    { mods = "SUPER", key = "v", action = act.PasteFrom("Clipboard") },
    -- Close Tab
    { mods = "SUPER", key = "w", action = act({ CloseCurrentTab = { confirm = true } }) },
    {
      mods = M.mod,
      key = "u",
      action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
    },

    { mods = M.mod, key = "m", action = act.TogglePaneZoomState },
    { mods = M.mod, key = "p", action = act.ActivateCommandPalette },
    { mods = M.mod, key = "d", action = act.ShowDebugOverlay },
    M.split_nav("resize", "CTRL", "LeftArrow", "Right"),
    M.split_nav("resize", "CTRL", "RightArrow", "Left"),
    M.split_nav("resize", "CTRL", "UpArrow", "Up"),
    M.split_nav("resize", "CTRL", "DownArrow", "Down"),
    M.split_nav("move", "CTRL", "h", "Left"),
    M.split_nav("move", "CTRL", "j", "Down"),
    M.split_nav("move", "CTRL", "k", "Up"),
    M.split_nav("move", "CTRL", "l", "Right"),
  }
end

function M.split_nav(resize_or_move, mods, key, dir)
  local event = "SplitNav_" .. resize_or_move .. "_" .. dir
  wezterm.on(event, function(win, pane)
    if M.is_nvim(pane) then
      -- pass the keys through to vim/nvim
      win:perform_action({ SendKey = { key = key, mods = mods } }, pane)
    else
      if resize_or_move == "resize" then
        win:perform_action({ AdjustPaneSize = { dir, 3 } }, pane)
      else
        local panes = pane:tab():panes_with_info()
        local is_zoomed = false
        for _, p in ipairs(panes) do
          if p.is_zoomed then
            is_zoomed = true
          end
        end
        wezterm.log_info("is_zoomed: " .. tostring(is_zoomed))
        if is_zoomed then
          dir = dir == "Up" or dir == "Right" and "Next" or "Prev"
          wezterm.log_info("dir: " .. dir)
        end
        win:perform_action({ ActivatePaneDirection = dir }, pane)
        win:perform_action({ SetPaneZoomState = is_zoomed }, pane)
      end
    end
  end)
  return {
    key = key,
    mods = mods,
    action = wezterm.action.EmitEvent(event),
  }
end

function M.is_nvim(pane)
  return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
end

return M
