vim.lsp.config('lua_ls', {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	}
})

vim.lsp.config('pyright', {
	cmd = { "pyright" },
	root_markers = { ".venv", "requirements.txt" },
	filetypes = { "python" },
})

vim.lsp.config('clangd', {
	cmd = { "clangd" },
	root_markers = { "Makefile" },
	filetypes = { "c" }
})

vim.lsp.config('marksman', {
	cmd = { "marksman" },
	filetypes = { "markdown" },
})

vim.lsp.config('R', {
	cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
	filetypes = { 'r', 'rmd', 'rnoweb' }
})
