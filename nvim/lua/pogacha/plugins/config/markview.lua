local presets = require('markview.presets');

local wiwi = {
	markdown = {
		list_items = {
			indent_size = 2,
			shift_width = 2,
			headings = presets.headings.marker,

			horizontal_rules = presets.horizontal_rules.dashed,
			checkboxes = presets.checkboxes.nerd,
		},
		code_blocks = {
			icons = "devicons",
		},
	}
}

require('markview').setup(wiwi)
