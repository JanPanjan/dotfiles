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

require('lazy').setup({
	{
		'nvim-neo-tree/neo-tree.nvim',
		enabled = true,
		lazy = true,
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- 'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		},
		cmd = 'Neotree',
		opts = {
			filesystem = {
				window = {
					width = 25,
					position = 'left', -- float, left, right, current
					mappings = {
						['\\'] = 'close_window',
					},
				},
			},
		}
	},

	{
		"chrisgrieser/nvim-spider",
		enabled = true,
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},

	{
		"OXY2DEV/markview.nvim",
		enabled = true,
		lazy = true,
		version = '*',
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			local presets = require('markview.presets');
			require('markview').setup({
				markdown = {
					list_items = {
						indent_size = 2,
						shift_width = 2,
					},
					code_blocks = {
						icons = "devicons",
					},
					headings = presets.headings.marker,
					horizontal_rules = presets.horizontal_rules.dashed,
					checkboxes = presets.checkboxes.nerd,
				}
			})
		end
	},

	{
		'L3MON4D3/LuaSnip',
		enabled = true,
		lazy = true,
		dependencies = {
			'rafamadriz/friendly-snippets',
			config = function()
				require('luasnip').config.setup({ enable_autosnippets = true })
				require('luasnip.loaders.from_vscode').lazy_load()
				require('luasnip.loaders.from_lua').load({
					paths = {
						'C:/Users/joene/AppData/Local/nvim_configs/nvim_min/lua/snippets'
					}
				})
			end,
		}
	},

	{ 'hrsh7th/cmp-buffer',       enabled = true, lazy = false },
	{ 'hrsh7th/cmp-path',         enabled = true, lazy = false },
	{ 'saadparwaiz1/cmp_luasnip', enabled = true, lazy = false },
	{ 'hrsh7th/cmp-nvim-lsp',     enabled = true, lazy = false },
	{ 'hrsh7th/cmp-nvim-lua',     enabled = true, lazy = false },
	{ 'hrsh7th/cmp-cmdline',      enabled = true, lazy = false },
	{
		'hrsh7th/nvim-cmp',
		enabled = true,
		event = 'InsertEnter',
		dependencies = {
			'onsails/lspkind.nvim'
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			local lspkind = require('lspkind')

			-- Add VSCode Dark+ Theme Colors to the Menu
			vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
			vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
			vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
			vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
			vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
			vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
			vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
			vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
			vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
			vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
			vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })

			cmp.setup {
				performance = { max_view_entries = 20, },
				completion = { completeopt = 'menu,menuone,preview,noselect' },
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				view = {
					entries = {
						name = 'custom', -- can be "custom", "wildmenu" or "native"
						selection_order = 'near_cursor',
					},
				},

				formatting = {
					format = lspkind.cmp_format({
						mode = "text",
						menu = ({
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							latex_symbols = "[Latex]",
						})
					}),
				},

				mapping = cmp.mapping.preset.insert {
					-- suggestions
					['<CR>'] = cmp.mapping.confirm { select = false },
					['<Tab>'] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,

					['<S-Tab>'] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,

					-- documentation
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					-- snippet insert nodes
					['<A-l>'] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { 'i', 's' }),

					['<A-h>'] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { 'i', 's' }),
				},

				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'cmp_r' },
					{ name = 'path' }, -- system file paths
				}),

				-- Set configuration for specific filetype.
				cmp.setup.filetype('gitcommit', {
					sources = cmp.config.sources({
						{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
					}, {
						{ name = 'buffer' },
					}),
				}),

				-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline('/', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = 'buffer' },
					},
				}),

				-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
				cmp.setup.cmdline(':', {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = 'path' },
					}, {
						{ name = 'cmdline' },
					}),
				})
			}
		end
	},

	{
		'echasnovski/mini.nvim',
		enabled = true,
		lazy = false,
		config = function()
			require('mini.ai').setup { n_lines = 500 }
			require('mini.surround').setup()
			require('mini.pairs').setup()
		end,
	},

	{
		'folke/zen-mode.nvim',
		opts = {
			window = {
				backdrop = 1,
				-- width = 80,
			}
		}
	},

	{
		'slugbyte/lackluster.nvim',
		config = function()
			local lackluster = require('lackluster')
			lackluster.setup({
				tweak_syntax = {
					comment = lackluster.color.gray4, -- or gray5
				},
				tweak_background = {
					menu = lackluster.color.gray3,
					popup = 'default',
				},
			})
		end
	},

	{ 'loctvl842/monokai-pro.nvim' },

	{ 'zenbones-theme/zenbones.nvim', dependencies = "rktjmp/lush.nvim", },

	{
		'joshuadanpeterson/typewriter',
		enabled = true,
		lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			require('typewriter').setup({
				enable_horizontal_scroll = false
			})
		end
	},

	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			-- vim.g.maplocalleader = " "
		end
	},

	{
		'jbyuki/nabla.nvim',
		keys = {
			{ '<leader>p', function() require("nabla").popup() end, desc = "PLG: show nabla popup" }
		},
	},
})
