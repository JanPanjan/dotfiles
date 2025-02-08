require('nvim-treesitter.configs').setup({
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		'html', 'java',
		'lua', 'luadoc',
		'markdown', 'markdown_inline', "rnoweb", "yaml", "latex", "csv",
		'python', 'r', 'rust', 'vim', 'vimdoc',
	},
	sync_install = false,
})
