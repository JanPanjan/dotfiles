--Makes background transparent and updates some highlight groups based on
---current colorscheme
local function set_hl()
	if vim.api.nvim_command_output('colorscheme') == 'everblush' then
		vim.api.nvim_set_hl(0, 'LineNr', { fg = '#404749' })
		vim.api.nvim_set_hl(0, 'Comment', { fg = '#404749' })
	end

	vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
	vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })
end

---Creates a popup window that let's me chose background theme
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')

local function set_background(choice)
	vim.opt.background = choice
end

local function create_background_popup()
	require('telescope.pickers').new(themes.get_dropdown({
		layout_config = {
			height = 6,
			width = 0.4,
		},
		prompt_title = 'Choose Background',
		previewer = false,
		borderchars = {
			{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
		}
	}), {
		finder = require('telescope.finders').new_table({ results = { 'light', 'dark' } }),
		sorter = require('telescope.config').values.generic_sorter({}),
		attach_mappings = function(_, map)
			actions.select_default:replace(function(prompt_bufnr)
				set_background(action_state.get_selected_entry().value)
				actions.close(prompt_bufnr)
			end)
			map('i', '<Esc>', actions.close)
			map('n', 'q', actions.close)
			return true
		end,
	}):find()
end


vim.api.nvim_create_user_command(
	'BG',
	create_background_popup,
	{ desc = 'PSN: creates a popup window to chose background mode', }
)
vim.keymap.set(
	'n',
	'<leader>dl',
	'<cmd>BG<CR>',
	{ desc = 'PSN: creates a popup window to chose background mode', }
)
--------------------------------------------------------------
vim.api.nvim_create_user_command(
	'CS',
	set_hl,
	{ desc = 'PSN: sets (removes) highlights' }
)
--------------------------------------------------------------
vim.api.nvim_create_user_command(
	'BGDark',
	'set background=dark',
	{ desc = 'PSN: sets background to dark' }
)
--------------------------------------------------------------
vim.api.nvim_create_user_command(
	'BGLight',
	'set background=light',
	{ desc = 'PSN: sets background to light' }
)
