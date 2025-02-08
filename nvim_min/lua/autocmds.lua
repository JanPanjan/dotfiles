vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup('TextYanking', { clear = true }),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = vim.api.nvim_create_augroup('FormatBuffer', { clear = true }),
	buffer = bufnr,
	callback = function()
		if not vim.o.binary and vim.o.filetype ~= 'diff' then
			local current_view = vim.fn.winsaveview()
			vim.cmd([[keeppatterns %s/\s\+$//e]])
			vim.fn.winrestview(current_view)
		end
		if vim.bo.filetype ~= "Rust" then
			vim.lsp.buf.format()
		end
	end
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup('ResizeWindows', { clear = true }),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})
