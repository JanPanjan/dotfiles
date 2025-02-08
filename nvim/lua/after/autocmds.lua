vim.api.nvim_create_autocmd('FileType', {
	group = vim.api.nvim_create_augroup('LuaGroup', { clear = true }),
	pattern = 'lua',
	callback = function()
		vim.opt_local.tabstop = 2
	end
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup('TextYanking', { clear = true }),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- Format buffer before writing
vim.api.nvim_create_autocmd('BufWritePre', {
	group = vim.api.nvim_create_augroup('FormatBuffer', { clear = true }),
	buffer = bufnr,
	callback = function()
		if vim.bo.filetype ~= "Rust" then
			vim.lsp.buf.format()
		end
	end
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup('ResizeWindows', { clear = true }),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})
