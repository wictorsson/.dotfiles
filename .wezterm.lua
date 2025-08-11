-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Keep your existing settings
config.color_scheme = "terafox"
config.font = wezterm.font("MesloLGS nf")
config.font_size = 16
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#152528",
			fg_color = "#7AA4A1",
		},
		inactive_tab = {
			bg_color = "#2F3239",
			fg_color = "#73A3B7",
		},
	},
}

return config
