vim.opt.tabstop = 4
vim.keymap.set('n', '<F5>', '<cmd>:w<CR><cmd>!py %<CR>')

vim.lsp.start(vim.lsp.config.pyright)
vim.lsp.enable('pyright')
