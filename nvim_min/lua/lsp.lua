local on_attach = function(client, bufnr)
	local bufopts = { buffer = bufnr, noremap = true, silent = true }
	local map = function(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, bufopts)
	end

	map('n', 'gd', vim.lsp.buf.definition)
	map('n', 'gD', vim.lsp.buf.declaration)
	map('n', '<leader>d', vim.diagnostic.open_float)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
	filetypes = { "lua" },
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			workspace = {
				checkThirdParty = false,
				library = {
					"$VIMRUNTIME",
					"$XDG_DATA_HOME/nvim/lazy",
					"${3rd}/luv/library",
				},
			},
		},
	},
})

vim.lsp.config('pyright', {
	cmd = { "pyright-langserver", "--stdio" },
	root_markers = { ".venv", "requirements.txt" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "python" },
})

vim.lsp.config('clangd', {
	cmd = { "clangd" },
	root_markers = { ".clangd", "compile_commands.json" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "c", "cpp" }
})

vim.lsp.config('marksman', {
	cmd = { "marksman" },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "markdown" },
})

vim.lsp.config('R', {
	cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { 'r', 'rmd', 'rnoweb' }
})
