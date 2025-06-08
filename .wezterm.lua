-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Keep your existing settings
config.color_scheme = "Gruvbox Material (Gogh)"
config.font = wezterm.font("MesloLGS nf")
config.font_size = 16
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#282828",
			-- fg_color = "#ebdbb2",
			fg_color = "#a89984",
		},
		inactive_tab = {
			bg_color = "#3c3836",
			fg_color = "#1d2021",
		},
	},
}

return config
