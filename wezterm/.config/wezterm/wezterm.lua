local wezterm = require("wezterm")

local dimmer = { brightness = 0.05 }
local config = {}

config.font = wezterm.font("Monaspace Neon")
config.font_size = 14.0
config.color_scheme = "Catppuccin Macchiato"
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/Wallpapers/Anime-Girl4.jpeg",
		},
		hsb = dimmer,
	},
}
config.window_background_opacity = 1.0
config.text_background_opacity = 0.5
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

return config
