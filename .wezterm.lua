-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("MesloLGS nf")
config.font_size = 12
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
