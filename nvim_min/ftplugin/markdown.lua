vim.opt.tabstop = 2
vim.lsp.enable("marksman")

vim.keymap.set('n', 'zj', function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	print(type(lines))
	print(unpack(lines))
	print(lines[0])
	for i = 1, 10, 1 do
		print(i)
	end
end, { desc = 'PSN: fold all headings in md file' })
