-- enable caching
vim.loader.enable()

-- global options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- pwsh as default shell
vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
vim.opt.shellquote = ''
vim.opt.shellxquote = ''

-- Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- `after` folder neovim prebere zadnje zato lah
-- requiram plugins-e v keymaps
require('lazy').setup({ { import = 'pogacha.plugins' } })
require('user_cmds')
require('after.options')
require('after.keymaps')
require('after.autocmds')

-- [[ THEMING ]]
-- minimal statusline
local statusline = {
	'%{&filetype}',
	' %M',
	'%=',
	' %t',
	'%=',
	' %p%%',
	' %l:%c '
}
vim.o.statusline = table.concat(statusline, '')

-- vim.cmd.colorscheme('kanagawabones')
-- vim.cmd.colorscheme("nano-theme")
-- vim.cmd.colorscheme("binary")
vim.cmd.colorscheme('lackluster')

if vim.api.nvim_command_output('colorscheme') == 'everblush' then
	vim.api.nvim_set_hl(0, 'LineNr', { fg = '#454749' })
	vim.api.nvim_set_hl(0, 'Comment', { fg = '#454749' })
end

-- vim.api.nvim_set_hl(0, 'Normal', { bg = '#050302' })
-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })

-- vim.api.nvim_set_hl(0, 'Statement', { fg = 'orange' })
-- vim.api.nvim_set_hl(0, 'Special', { fg = 'orange' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'black' })
vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
vim.api.nvim_set_hl(0, "statusline", { bg = "black" })
