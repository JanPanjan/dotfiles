-- Enables mouse functionality in neovim
-- [n]ormal, [v]isual, [i]nsert, [c]ommand-line, [a]ll
vim.opt.mouse          = 'a'

-- Sets cursor to block in insert mode
vim.opt.guicursor      = ''

-- Time Neovim waits to recive next key in keymaps with multiple keys
vim.opt.timeout        = true
vim.opt.timeoutlen     = 1000

-- Enables yanking content to OS clipboard
vim.opt.clipboard      = 'unnamedplus'

-- Enables undofile functionality (:h 'undofile')
vim.opt.undofile       = true
-- Remove storing of shada files
vim.opt.swapfile       = false

-- Sets line and relative numbers
vim.opt.number         = true
vim.opt.relativenumber = true

-- Sets number line column width
vim.o.numberwidth      = 4

-- Enables signcolumn
vim.opt.signcolumn     = 'no'

-- Draws color column on column 81
vim.opt.colorcolumn    = '81'

-- Hides NeoVim mode in statusbar
vim.opt.showmode       = true

-- Preffered split direction
vim.opt.splitright     = true
vim.opt.splitbelow     = true

-- Number of spaces that a tab counts as
vim.opt.tabstop        = 4
-- Expand tabs to spaces by default
vim.opt.expandtab      = false
-- Number of spaces to use for each (auto)indent
vim.opt.shiftwidth     = 0 -- 0 uses tabstop value
-- Enables displaying of whitespace characters
vim.opt.list           = true
vim.opt.listchars      = { tab = '   ', trail = '·', nbsp = '␣' }

-- Enables cursorline
vim.opt.cursorline     = false
-- Sets mode in which the cursorline can be concealed
vim.o.concealcursor    = 'n'
-- Determines how text with concealed syntax is shown
vim.o.conceallevel     = 2 -- 0 to 3

-- Disables word wraping at the end of the screen
vim.o.wrap             = false
-- Enables linebreaks (breaks line without breaking a word in half)
vim.o.linebreak        = true

-- Determines when to start shifting text up/down while scrolling
vim.o.scrolloff        = 12

-- Smart indenting
vim.opt.smartindent    = true

-- Ignores case when searching
vim.opt.ignorecase     = true
-- Ignore previous setting if search pattern contains upper-case letters
vim.opt.smartcase      = true

-- Auto-complete on tab, while in command mode
vim.opt.wildmenu       = true
-- Ignore case when completing in command mode
vim.opt.wildignorecase = true
-- Use popup menu for completions in command mode
vim.opt.wildoptions    = 'pum'
-- Max number of items visible in popup menu
vim.opt.pumheight      = 12
-- Auto select the first entry but don't insert also show additional
-- information, if available
vim.opt.completeopt    = 'noinsert,menuone,popup'

-- Use interactive replace
vim.opt.inccommand     = 'split'
-- Use interactive search
vim.opt.incsearch      = true

-- Use global status line
vim.opt.laststatus     = 3
-- command height
vim.opt.ch             = 0

-- Automatically Read changes made to file outside of Vim
vim.opt.autoread       = true

-- Enable true colors if supported
if (vim.fn.has('termguicolors')) then
	vim.opt.termguicolors = true
end
