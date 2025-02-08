local builtin = require('telescope.builtin')

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),

	callback = function(event)
		local mapLsp = function(keys, func, mode)
			mode = mode or 'n'
			vim.keymap.set(mode, keys, func, { buffer = event.buf })
		end

		-- Go to definition of object under cursor
		mapLsp('gd', builtin.lsp_definitions)
		-- Go to declaration of object under cursor
		mapLsp('gD', vim.lsp.buf.declaration)
		-- Go to references of object under cursor
		mapLsp('gr', builtin.lsp_references)
		-- Rename object under cursor
		mapLsp('<leader>rn', vim.lsp.buf.rename)
		-- Open code action menu
		mapLsp('<leader>ca', vim.lsp.buf.code_action, { 'n', 'v' })
		-- Show diagnostics for current file
		mapLsp('<leader>D', '<cmd> Telescope diagnostics bufnr=0 <CR>')
		-- Show diagnostics for current file
		mapLsp('<leader>d', vim.diagnostic.open_float)
		-- Go to next diagnostic
		mapLsp('<A-x>', vim.diagnostic.goto_next)
		-- Go to previous diagnostic
		mapLsp('<A-y>', vim.diagnostic.goto_prev)
		-- Restart LSP
		mapLsp('<leader>rs', '<cmd> LspRestart <CR>')
	end,
})

local cmp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')
local capabilities = cmp.default_capabilities()

-- Configure each server manually
lspconfig.marksman.setup({ capabilities = capabilities })
lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.pyright.setup({ capabilities = capabilities })

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME
				}
			}
		}
	}
})

lspconfig.r_language_server.setup {
	capabilities = capabilities,
	settings = {
		r = {
			lsp = {
				rich_documentation = true,
				diagnostics = true,
			},
		},
	},
	on_attach = function()
		vim.diagnostic.config {
			virtual_text = false, -- Virtual text (the inline hints)
			signs = true,      -- Show signs in the gutter
			underline = false, -- Underline problematic code
		}
	end,
}
