local wezterm = require 'wezterm'
local theme = require('theme')
local visual = require('visual')
local config = wezterm.config_builder()

theme.apply(config)
visual.apply(config)

return config
