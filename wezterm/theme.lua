local wezterm = require('wezterm')
local M = {}

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'OneDark (Gogh)'
  else
    return 'One Light (Gogh)'
  end
end

function M.apply(config)
  config.color_scheme = scheme_for_appearance(get_appearance())
end

return M
