-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = "terafox"
config.font = wezterm.font("MesloLGS nf")
config.font_size = 16
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "30cell",
	right = "10cell",
	top = "0cell",
	bottom = "0cell",
}

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
wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("Tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("Tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		mods = "CTRL",
		key = "b",
		action = act.EmitEvent("toggle-tabbar"),
	},
	{
		mods = "CTRL",
		key = "h",
		action = act.EmitEvent("toggle-padding"),
	},
}
wezterm.on("toggle-padding", function(window, _)
	local overrides = window:get_config_overrides() or {}
	-- check current padding, then toggle
	if overrides.window_padding and overrides.window_padding.left == "40cell" then
		wezterm.log_info("setting small padding")
		overrides.window_padding = {
			left = "5cell",
			right = "5cell",
			top = "0cell",
			bottom = "0cell",
		}
	else
		wezterm.log_info("setting large padding")
		overrides.window_padding = {
			left = "40cell",
			right = "10cell",
			top = "0cell",
			bottom = "0cell",
		}
	end

	window:set_config_overrides(overrides)
end)
-- config.keys = {
-- {key="enter", mods="shift", action=wezterm.action{sendstring="\x1b\r"}},
-- }

return config
