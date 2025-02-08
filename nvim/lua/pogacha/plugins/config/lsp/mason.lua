require('mason').setup()

require('mason-lspconfig').setup({
	-- servers that mason should install
	ensure_installed = {
		'lua_ls',
		'pyright',
		'clangd',
		'jdtls',
		'marksman',
	},

	-- auto-install configures servers with lspconfig
	-- (not the same as ensure_installed)
	automatic_instalation = true
})

require('mason-lspconfig').setup_handlers({
	function(server_name)
		require('lspconfig')[server_name].setup({})
	end
})
