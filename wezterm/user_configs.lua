local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("set-dev-password", function(_, pane)
  local _, stdout, _ = wezterm.run_child_process({
    "security",
    "find-generic-password",
    "-w",
    "-a",
    "DevLikePassword",
  })
  pane:send_text(stdout)
end)
wezterm.on("set-prod-password", function(_, pane)
  local _, stdout, _ = wezterm.run_child_process({
    "security",
    "find-generic-password",
    "-w",
    "-a",
    "ProdLikePassword",
  })
  pane:send_text(stdout)
end)
M = {}
M.font_size = 21
M.keys = {
  {
    key = ".",
    mods = "OPT",
    action = wezterm.action_callback(function(window, pane)
      -- We're going to dynamically construct the list and then
      -- show it. Here we're just showing some numbers but you
      -- could read or compute data from other sources

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
              -- sending the label
              local a, stdout, b = wezterm.run_child_process({
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
