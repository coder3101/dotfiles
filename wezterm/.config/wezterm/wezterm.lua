local wezterm = require("wezterm")

local dimmer = { brightness = 0.1 }
local config = {}

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

local is_darwin = function()
	return wezterm.target_triple:find("darwin") ~= nil
end

-- Begin common configuration for wezterm
config.font = wezterm.font("Monaspace Neon")
config.color_scheme = "Catppuccin Macchiato"
config.background = {
	{
		source = {
			File = os.getenv("HOME") .. "/Wallpapers/walls/Anime-Girl5.jpg",
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

-- Begin OS specific configuration
if is_linux() then
	config.font_size = 12.0
elseif is_darwin then
	config.font_size = 17.0
end
return config
