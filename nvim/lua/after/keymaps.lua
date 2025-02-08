local map = function(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

local builtin = require("telescope.builtin")
local themes = require('telescope.themes')
local utils = require('telescope.utils')

local function uppercase_first_char()
	local current_word = vim.fn.expand("<cword>")                                        -- Get the current word under the cursor
	if #current_word > 0 then
		local first_char_upper = string.upper(current_word:sub(1, 1)) .. current_word:sub(2) -- Uppercase first char
		vim.api.nvim_command("normal! ciw" .. first_char_upper)                            -- Replace the word
	end
end

function _G.surround_with_backtics()
	if vim.bo.filetype == "markdown" then
		local cur_word = vim.fn.expand('<cWORD>')
		print("`" .. cur_word .. "`")
		return '\\`' .. cur_word .. '\\`'
	end
end

local no_preview = function(opts)
	return themes.get_dropdown({
		cwd = opts.cwd or utils.buffer_dir(),
		find_command = opts.find_command or { 'fd' },
		borderchars = {
			{ '─', '│', '─', '│', '┌', '┐', '┘', '└' },
			prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		},
		width = 0.8,
		previewer = false,
		prompt_title = opts.prompt_title or false,
		enable_preview = opts.enable_preview or nil
	})
end

-- Stay in visual mode after indenting visual selection
map('v', '<', '<gv', { desc = 'Stay in visual mode after indenting visual selection' })
map('v', '>', '>gv', { desc = 'Stay in visual mode after indenting visual selection' })

-- Keep cursor inplace while joining lines
map('n', 'J', 'mzJ`z', { desc = 'PSN: Keep cursor inplace while joining lines' })

-- Create a list item in insert mode (markdown files in mind),
-- so it doesn't remap window navigation keymap
map('i', '<C-l>', '- ', { desc = 'PSN: add a list item in insert mode', remap = true })

-- Use Shift + J/K to moves selected lines up/down in visual mode
map('v', 'J', "<CMD>m '>+1<CR>gv=gv", { desc = 'PSN: Use Shift + J to moves selected lines down in visual mode' })
map('v', 'K', "<CMD>m '<-2<CR>gv=gv", { desc = 'PSN: Use Shift + J to moves selected lines up in visual mode' })

-- Keep current search result centered on the screen
map('n', 'n', 'nzz', { desc = 'PSN: Keep current search result centered on the screen' })
map('n', 'N', 'Nzz', { desc = 'PSN: Keep current search result centered on the screen' })

-- turn begining of the word to upper-case
-- NOT WORKING
map(
	'n',
	'<leader>fu',
	uppercase_first_char,
	{
		desc = 'PSN: turn begining of the word to upper-case',
		expr = true,
		noremap = true,
		silent = true
	})

-- turn current word into upper-case
map('n', '<leader>U', 'vawgUe', { desc = 'PSN: turn current word into upper-case', remap = true })
-- turn current word into lower-case (currently non-functional)
map('n', '<leader>u', 'vawgue', { remap = true, desc = 'PSN: turn current word into lower-case' })

-- somethins not right..
map('n',
	'<leader>c',
	'v:lua.surround_with_backtics()',
	{
		desc = 'PSN: create an inline code block from the current word',
		noremap = true,
		expr = true,
		silent = true
	}
)

-- toggle colorcolumn
map('n', '<leader>cc', function()
	--
end)

-- yank, comment and past a duplicate line
map('n', 'yp', 'yygccp', { remap = true, desc = 'PSN: yank, comment and past a duplicate line' })

-- https://vi.stackexchange.com/q/12607/15292
-- Do not include white space characters when using $ in visual mode,
map("x", "$", "g_", { desc = 'PSN: Do not include white space characters when using $ in visual mode' })

-- Copy entire buffer
map("n", "<leader>y", "<cmd>%yank<cr>", { desc = 'PSN: Copy entire buffer' })

-- remove highlight afer search
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'PSN: remove highlight afer search' })

-- exit insert mode with 2 j's
map('i', 'jj', '<esc>', { desc = "PSN: exit insert mode with 2 j's" })

-- enter command mode with comma
map('n', ',', ':', { desc = 'PSN: enter command mode with comma' })

-- Use ctrl+space for omnifunc
map('i', '<C-Space>', '<C-x><C-o>', { desc = 'PSN: Use ctrl+space for omnifunc' })
-- Use alt+space for completefunc
map('i', '<A-Space>', '<C-x><C-u>', { desc = 'PSN: Use alt+space for completefunc' })

-- enable zen mode
map('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'PSN: enable zen mode' })

-- toggle typewriter mode
map('n', '<leader>tw', '<cmd>TWToggle<CR>', { desc = 'PSN: toggle typewriter mode' })

-- toggle markview rendering
map({ 'n', 'i' }, '<C-p>', '<cmd>Markview toggle<CR>', { desc = 'PSN: toggle markview rendering' })

-- move to previous buffer
map('n', '<a-a>', '<cmd>bprev<CR>', { desc = 'PSN: move to previous buffer' })
-- move to next buffer
map('n', '<a-d>', '<cmd>bnext<CR>', { desc = 'PSN: move to next buffer' })
-- close current buffer
map('n', '<a-s>', '<cmd>bdelete<CR>', { desc = 'PSN: close current buffer' })

-- Move the cursor based on physical lines, not the actual lines.
--	 Actual Lines: These are the lines defined by line breaks in the file.
--	 Physical Lines: These are the lines as displayed on the screen, which
--	 may be different from actual lines due to line wrapping.
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'PSN: Move the cursor based on physical lines' })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'PSN: Move the cursor based on physical lines' })

-- navigate windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'PSN: navigate to left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'PSN: navigate to right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'PSN: navigate to bottom window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'PSN: navigate to upper window' })

-- open netrw explorer
map('n', '<leader>pl', '<cmd>Explore <CR>', { desc = 'PSN: open netrw explorer' })
-- open file tree
map('n', '\\', '<cmd>Neotree reveal <CR>', { desc = 'PSN: open file tree' })

map('n', '<leader>sg', builtin.live_grep, { desc = 'PSN: grep from files in current directory' })
map('n', '<leader><leader>', builtin.buffers, { desc = 'PSN: open list of open buffers' })
-- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'PSN: open diagnostics list for current file' })
map('n', '<leader>q', builtin.diagnostics, { desc = 'PSN: open diagnostics list for current file' })

map('n',
	'<leader>sd',
	function()
		builtin.diagnostics(no_preview())
	end,
	{ desc = 'PSN: open diagnostics list for files in current root directory' }
)

map(
	'n',
	'<leader>cs',
	function()
		builtin.colorscheme(no_preview({ enable_preview = true }))
		vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	end,
	{ desc = 'PSN: open colorscheme picker' })

map(
	'n',
	'<leader>sh',
	function()
		builtin.help_tags(no_preview({}))
	end,
	{ desc = 'PSN: search help tags' })

map(
	'n',
	'<leader>sf',
	function()
		builtin.find_files(no_preview({
			prompt_title = "Root"
		}))
	end,
	{ desc = 'PSN: search files in current root directory' }
)

map(
	'n',
	'<leader>ff',
	function()
		builtin.current_buffer_fuzzy_find(no_preview({
			cwd = 'C:/Users/joene/AppData/Local/nvim',
		}))
	end
)

map(
	'n',
	'<leader>sn',
	function()
		builtin.find_files(no_preview({
			cwd = 'C:/Users/joene/AppData/Local/nvim',
			prompt_title = "Config"
		}))
	end,
	{ desc = 'PSN: search Neovim configuration files' }
)

map('n', '<leader>sp', function()
		builtin.find_files(themes.get_ivy({
			cwd = 'C:/Users/joene/Documents/progAAAAAAA',
			find_command = {
				'fd', '.', '--type', 'directory', '--max-depth', '1'
			},
			prompt_title = false
		}))
	end,
	{ desc = 'PSN: search projects' }
)
