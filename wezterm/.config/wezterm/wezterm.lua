local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font("Monaspace Neon")
config.font_size = 15.0
config.color_scheme = "Catppuccin Macchiato"
config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/images/mountain.jpg"
config.window_background_opacity = 1.0
config.window_background_image_hsb = {
	brightness = 0.3,
}
config.text_background_opacity = 0.75
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

return config
