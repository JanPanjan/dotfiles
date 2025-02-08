return {
	filesystem = {
		window = {
			width = 25,
			position = 'left', -- float, left, right, current
			mappings = {
				['\\'] = 'close_window',
				['P'] = 'toggle_preview',
				['l'] = 'focus_preview',
				['S'] = 'open_split',
				['s'] = 'open_vsplit',
				['A'] = 'add_directory', -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				['d'] = 'delete',
				['r'] = 'rename',
				['m'] = 'move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
				['q'] = 'close_window',
				['R'] = 'refresh',
				['?'] = 'show_help',
				['<'] = 'prev_source',
				['>'] = 'next_source',
				['i'] = 'show_file_details',
			},
		},
	},
}
