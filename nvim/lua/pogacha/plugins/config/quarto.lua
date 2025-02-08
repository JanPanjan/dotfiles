local quarto = require('quarto')

quarto.setup {
	debug = true,
	closePreviewOnExit = true,

	lspFeatures = {
		enabled = true,
		chunks = 'curly',
		languages = { 'r', 'python', 'julia', 'bash', 'html' },
		diagnostics = {
			enabled = true,
			triggers = { 'BufWritePost' },
		},
		completion = {
			enabled = true,
		},
	},

	codeRunner = {
		enabled = true,
		default_method = nil, -- 'molten' or 'slime'
		ft_runners = {},      -- filetype to runner, ie. `{ python = "molten" }`.
		-- Takes precedence over `default_method`
		never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
	},
}

local runner = require("quarto.runner")

map('n', '<leader>pq', '<cmd>:QuartoPreview<CR>')
map("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
map("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
map("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
map("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
map("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
map("n", "<localleader>RA", function()
    runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })

