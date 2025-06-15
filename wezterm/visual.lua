local wezterm = require('wezterm')
local M = {}

function M.apply(config)
  config.initial_cols = 120
  config.initial_rows = 28
  config.font_size = 14

  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true
  config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  }
  config.font = wezterm.font('JetBrains Mono', { weight = 'Light' })
end

return M
