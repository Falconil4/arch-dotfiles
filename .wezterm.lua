local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.keys = {
  {
    mods = "ALT",
    key = "a",
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    mods = "ALT",
    key = "d",
    action = wezterm.action.CloseCurrentPane { confirm = false }
  },
  {
    mods = "ALT",
    key = "v",
    action = wezterm.action.SplitVertical
  },
  {
    mods = "ALT",
    key = "|",
    action = wezterm.action.SplitHorizontal
  },
  {
    mods = "ALT",
    key = "h",
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    mods = "ALT",
    key = "j",
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    mods = "ALT",
    key = "k",
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    mods = "ALT",
    key = "l",
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    mods = "ALT",
    key = "1",
    action = wezterm.action.ActivateTab(0),
  },
  {
    mods = "ALT",
    key = "2",
    action = wezterm.action.ActivateTab(1),
  },
  {
    mods = "ALT",
    key = "3",
    action = wezterm.action.ActivateTab(2),
  },
  {
    mods = "ALT",
    key = "4",
    action = wezterm.action.ActivateTab(3),
  },
  {
    mods = "ALT",
    key = "5",
    action = wezterm.action.ActivateTab(4),
  },
}

return config
