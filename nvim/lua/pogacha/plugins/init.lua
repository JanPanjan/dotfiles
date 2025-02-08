-- v tem file so installed plugins, medtem ko ima vsak
-- svoj config file (if neccessary) znotraj pogacha/config directorija
return {
	-- Color themes
	require('pogacha.plugins.colors'),

	{ -- Better syntax coloring
		'nvim-treesitter/nvim-treesitter',
		enabled = true,
		version = false,
		build = ':TSUpdate',
		event = "VeryLazy",
		config = function()
			require('pogacha.plugins.config.treesitter')
		end
	},

	{ -- UI and other wonderful features
		'nvim-telescope/telescope.nvim',
		enabled = true,
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{
				'nvim-tree/nvim-web-devicons',
				enabled = vim.g.have_nerd_font
			},
		},
		config = function()
			require('pogacha.plugins.config.telescope')
		end
	},

	{ -- Explorer tree
		'nvim-neo-tree/neo-tree.nvim',
		enabled = true,
		lazy = true,
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		},
		cmd = 'Neotree',
		opts = require('pogacha.plugins.config.neo-tree'),
	},

	{ -- Snippet engine
		'L3MON4D3/LuaSnip',
		enabled = true,
		lazy = true,
		dependencies = {
			'rafamadriz/friendly-snippets',
			config = function()
				require('pogacha.plugins.config.luasnip')
			end,
		}
	},

	-- Other cmp "dependencies"
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
			require('pogacha.plugins.config.cmp')
		end
	},

	{
		'williamboman/mason.nvim',
		enabled = true,
		lazy = false,
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			require('pogacha.plugins.config.lsp.mason')
		end,
	},

	{
		'neovim/nvim-lspconfig',
		enabled = true,
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			{ 'antosha417/nvim-lsp-file-operations', config = true },
			'nvim-java/nvim-java'
		},
		config = function()
			require('pogacha.plugins.config.lsp.lspconfig')
		end,
	},

	{ -- R in Neovim
		'jalvesaq/Nvim-R',
		enabled = false,
		lazy = true,
		ft = { 'r', 'rmd', 'qmd' },
		config = function()
			vim.g.R_auto_start = 1
			vim.g.R_hl_term = 1
			vim.g.R_quiet = 1
			vim.g.R_assign = false
		end,
	},

	{ -- Quarto in Neovim
		'quarto-dev/quarto-nvim',
		enabled = false,
		lazy = true,
		dependencies = {
			'neovim/nvim-lspconfig',
			'jmbuhr/otter.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			require('pogacha.plugins.config.quarto')
		end,
	},

	{ -- LaTeX in Neovim
		"lervag/vimtex",
		enabled = true,
		lazy = true,
		init = function()
			require('pogacha.plugins.config.vimtex')
		end
	},

	{ -- Rust in Neovim (fix lspconfig error)
		'mrcjkb/rustaceanvim',
		enabled = false,
		lazy = true,
		version = '^5', -- Recommended
		config = function()
			require('pogacha.plugins.config.lsp.rustaceanvim')
		end
	},

	{ -- Collection of various small independent plugins/modules
		'echasnovski/mini.nvim',
		enabled = true,
		lazy = false,
		config = function()
			require('mini.ai').setup { n_lines = 500 }
			require('mini.surround').setup()
			require('mini.pairs').setup()
		end,
	},

	{ -- Quick terminal access inside NeoVim
		'akinsho/toggleterm.nvim',
		enabled = true,
		event = 'VeryLazy',
		version = '*',
		opts = {
			open_mapping = '<c-s>',
			autochdir = true,
			shading_factor = 1,
			close_on_exit = false,
			direction = 'horizontal', -- vertical, horizontal, tab, float
			-- size = 10
		},
	},

	{ -- Distraction free environment
		'folke/zen-mode.nvim',
		enabled = true,
		lazy = false,
		opts = require('pogacha.plugins.config.zen')
	},

	{ -- Preview markdown files
		"toppair/peek.nvim",
		enabled = true,
		lazy = true,
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require('pogacha.plugins.config.peek')
		end,
	},

	{ -- Markdown rendering inside Neovim
		"OXY2DEV/markview.nvim",
		enabled = true,
		lazy = false,
		version = '*',
		ft = "markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require('pogacha.plugins.config.markview')
		end
	},

	{ -- ASCII generator from LaTeX equations
		'jbyuki/nabla.nvim',
		keys = {
			{
				'<leader>p',
				'<cmd>lua require"nabla".popup()<CR>',
				desc = 'PSN: open a Nabla popup for equation under cursor'
			},
		},
	},

	{ -- Keep view centered when typing
		'joshuadanpeterson/typewriter',
		enabled = true,
		lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		config = function()
			require('typewriter').setup({
				-- center only while moving up and down
				enable_horizontal_scroll = false
			})
		end
	},

	{ -- use the w, e, b motions like a spider. Move by subwords and skip insignificant punctuation.
		"chrisgrieser/nvim-spider",
		enabled = true,
		lazy = true,
		keys = {
			{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
			{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
			{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
		},
	},

	{ "lukas-reineke/indent-blankline.nvim" },

	{ -- News feed about plugins
		"neo451/feed.nvim",
		cmd = "Feed"
	}
}
