require('luasnip').config.setup({ enable_autosnippets = true })

-- Tu importamo snippets
require('luasnip.loaders.from_vscode').lazy_load()

require('luasnip.loaders.from_lua').load({
	paths = {
		'C:/Users/joene/AppData/Local/nvim_configs/nvim/lua/snippets'
	}
})
