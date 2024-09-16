local wezterm = require("wezterm")
local act = wezterm.action
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

M = {}
M.font_size = 22
M.keys = {
  {
    key = "LeftArrow",
    mods = "OPT",
    action = act({
      SendKey = {
        key = "b",
        mods = "ALT",
      },
    }),
  },
  {
    key = "RightArrow",
    mods = "OPT",
    action = act({
      SendKey = {
        key = "f",
        mods = "ALT",
      },
    }),
  },
  {
    key = [[\]],
    mods = "ALT",
    action = act({
      SplitHorizontal = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    key = [[-]],
    mods = "ALT",
    action = act({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    key = "q",
    mods = "SUPER",
    action = act({ CloseCurrentPane = { confirm = true } }),
  },
  {
    key = "h",
    mods = "ALT",
    action = act({ ActivatePaneDirection = "Left" }),
  },
  {
    key = "l",
    mods = "ALT",
    action = act({ ActivatePaneDirection = "Right" }),
  },
  {
    key = "k",
    mods = "ALT",
    action = act({ ActivatePaneDirection = "Up" }),
  },
  {
    key = "j",
    mods = "ALT",
    action = act({ ActivatePaneDirection = "Down" }),
  },
  {
    key = "h",
    mods = "SUPER|ALT",
    action = act({ AdjustPaneSize = { "Left", 2 } }),
  },
  {
    key = "l",
    mods = "SUPER|ALT",
    action = act({ AdjustPaneSize = { "Right", 2 } }),
  },
  {
    key = "k",
    mods = "SUPER|ALT",
    action = act({ AdjustPaneSize = { "Up", 2 } }),
  },
  {
    key = "j",
    mods = "SUPER|ALT",
    action = act({ AdjustPaneSize = { "Down", 2 } }),
  },
  {
    key = "t",
    mods = "ALT",
    action = act.SpawnTab("DefaultDomain"),
  },
  {
    key = "g",
    mods = "ALT",
    action = act.SplitHorizontal({
      domain = "CurrentPaneDomain",
      args = { "lazygit" },
      set_environment_variables = {
        EDITOR = "nvim",
        VISUAL = "nvim",
      },
    }),
  },
  {
    key = "g",
    mods = "ALT|SHIFT",
    action = act.SplitVertical({
      domain = "CurrentPaneDomain",
      args = { "lazygit" },
      set_environment_variables = {
        EDITOR = "nvim",
        VISUAL = "nvim",
      },
    }),
  },
  {
    key = "n",
    mods = "ALT",
    action = act.SplitHorizontal({
      domain = "CurrentPaneDomain",
      args = { "nvim" },
      set_environment_variables = {
        EDITOR = "nvim",
        VISUAL = "nvim",
      },
    }),
  },
  {
    key = "r",
    mods = "ALT",
    action = act.PromptInputLine({
      description = "Enter name for tab",
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
  {
    key = "w",
    mods = "ALT",
    action = act({ CloseCurrentTab = { confirm = true } }),
  },
  {
    key = "Tab",
    mods = "ALT",
    action = act({ ActivateTabRelative = 1 }),
  },
  {
    key = "Tab",
    mods = "ALT|SHIFT",
    action = act({ ActivateTabRelative = -1 }),
  }, -- standard copy/paste bindings
  {
    key = "m",
    mods = "ALT",
    action = act.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS|COMMANDS" }),
  },
  {
    key = "x",
    mods = "ALT",
    action = "ActivateCopyMode",
  },
  {
    key = "v",
    mods = "SUPER",
    action = act({ PasteFrom = "Clipboard" }),
  },
  {
    key = "c",
    mods = "SUPER",
    action = act({ CopyTo = "ClipboardAndPrimarySelection" }),
  },
}

for i = 1, 9 do
  table.insert(M.keys, {
    key = tostring(i),
    mods = "CTRL|ALT",
    action = act.MoveTab(i - 1),
  })
end

return M
