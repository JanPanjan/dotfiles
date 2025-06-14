local wezterm = require 'wezterm'

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return 'Dark'
end

local function scheme_for_appearance(appearance)
	-- if appearance:find 'Dark' then
	-- return 'OneDark (Gogh)'
	-- else
	return 'One Light (Gogh)'
	-- end
	-- return 'OneDark (Gogh)'
end

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28
config.font_size = 13

config.color_scheme = scheme_for_appearance(get_appearance())

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
config.font = wezterm.font('JetBrains Mono', { weight = 'Light' })

return config
