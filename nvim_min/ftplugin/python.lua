vim.opt.tabstop = 4

vim.lsp.enable('pyright')
vim.keymap.set('n', '<F5>', '<cmd>:w<CR><cmd>!py %<CR>')
