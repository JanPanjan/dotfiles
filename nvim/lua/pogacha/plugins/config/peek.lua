require("peek").setup({
	theme = 'light',
	-- theme = 'dark',
	app = 'browser',
	-- filetype = { 'markdown', 'quarto' }
})
vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
