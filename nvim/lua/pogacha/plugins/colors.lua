return {
	{
		"jackplus-xyz/binary.nvim",
		config = function()
			require('binary').setup({
				style = 'system',
				colors = { -- Colors used for the "light" theme; reversed automatically for "dark"
					-- bg = "#00CA9E",
				},
			})
		end
	},

	{
		'Everblush/nvim',
		enabled = true,
		name = 'everblush',
		config = function()
			require('everblush').setup({
				transparent_background = true,
				nvim_tree = {
					contrast = true
				}
			})
		end
	},

	{
		'rebelot/kanagawa.nvim',
		enabled = true,
		opts = {
		},
		config = function()
			require('kanagawa').setup({
				compile = true,
				keywordStyle = { italic = false },
				statementStyle = { bold = false },
				dimInactive = true,
				transparent = true,
				colors = {
					theme = { all = { ui = { bg_gutter = "none" } } }
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						TelescopeTitle = { fg = theme.ui.special, bold = true },
						TelescopePromptNormal = { bg = theme.ui.bg_p1 },
						TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
						TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
						TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
						TelescopePreviewNormal = { bg = theme.ui.bg_dim },
						TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
					}
				end,
			})
		end
	},

	{
		'zenbones-theme/zenbones.nvim',
		enabled = true,
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = 'rktjmp/lush.nvim',
		config = function()
			vim.g.zenbones_compat = 1
			vim.g.tokyobones = {
				italic_comments = false,
				transparent_background = true
			}
			vim.g.rosebones = {
				italic_comments = false,
				transparent_background = true
			}
			vim.g.forestbones = {
				italic_comments = true,
				lighten_cursor_line = 0,
				transparent_background = true
			}
			vim.g.zenburned = {
				transparent_background = true
			}
		end
	},

	{
		'razcoen/fleet.nvim',
		enabled = true,
		config = function()
		end
	},

	{
		'slugbyte/lackluster.nvim',
		enabled = true,
		config = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				tweak_syntax = {
					comment = lackluster.color.gray5, -- or gray5
				},
				tweak_background = {
					normal = 'none',
					telescope = 'none',
					menu = lackluster.color.gray3,
					popup = 'default',
				},
			})
		end
	},

	{ 'L-Colombo/atlantic-dark.nvim',     enabled = false },
	{ 'srcery-colors/srcery-vim',         enabled = false },
	{ 'marko-cerovac/material.nvim',      enabled = false },
	{ 'mellow-theme/mellow.nvim',         enabled = false },
	{ 'aktersnurra/no-clown-fiesta.nvim', enabled = false },
	{ 'Rigellute/shades-of-purple.vim',   enables = false },
	{ 'bettervim/yugen.nvim',             enabled = false },
	{ 'ferdinandrau/lavish.nvim',         enabled = false },
	{ 'glenntnorton/adaryn.vim',          enabled = false },
	{ 'whatyouhide/vim-gotham',           enabled = false },
	{ 'catriverr/inrainbows.vim',         enabled = false },
	{ 'sainnhe/gruvbox-material',         enabled = false },
	{ 'Mofiqul/vscode.nvim',              enabled = false },
	{ 'sainnhe/sonokai',                  enabled = false },
	{ 'mstcl/ivory',                      enabled = false },
	{ "olimorris/onedarkpro.nvim",        enabled = false },
	{ "bartekjaszczak/finale-nvim",       enabled = false },
	{ "ilof2/posterpole.nvim",            enabled = false },
	{ "ficcdaf/ashen.nvim",               enabled = true },
	{ "miikanissi/modus-themes.nvim",     enabled = true },
	{ "ronisbr/nano-theme.nvim",          enabled = true },
	{ 'nyoom-engineering/oxocarbon.nvim', enabled = true },
	{ 'cpwrs/americano.nvim',             enabled = true, },
	{ 'rose-pine/neovim',                 enabled = false, name = 'rose-pine' },
	{ 'catppuccin/nvim',                  enabled = true,  name = 'catppuccin' },
	{ 'Verf/deepwhite.nvim',              enabled = true,  opts = { low_blue_light = false } },
	{ 'ribru17/bamboo.nvim',              enabled = true,  opts = { transparent = false } },
}
