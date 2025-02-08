-- https://nuxsh.is-a.dev/blog/custom-nvim-statusline.html
-- Define each module individually
-- Build statusline at the end

-- translations for return value of vim.api.nvim_get_mode().mode
local modes = {
	["n"] = "N",
	["no"] = "N",
	["v"] = "V",
	["V"] = "V",
	["CTRL-V"] = "V",
	["s"] = "S",
	["S"] = "S",
	["CTRL-S"] = "S",
	["i"] = "I",
	["ic"] = "I",
	["R"] = "R",
	["Rc"] = "R",
	["Rv"] = "R",
	["c"] = "C",
	["r"] = "P",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "S",
	["t"] = "T",
}

-- get the mode and match it with translation
function mode()
	local cur_mode = modes[vim.api.nvim_get_mode().mode]
	return string.format(" %s", cur_mode)
end

-- get the filepath
function filepath()
	local path = vim.fn.expand("%")
	-- use modifiers with fnamemodify:
	-- 		:~ reduces filename to relative path to home dir (e.g. /home/user to ~)
	-- 		:- reduces filename to relative path to cur dir
	-- 		:h reduces filename to name of current file
	local f_path = vim.fn.fnamemodify(path, ":~:.:h")
	if f_path == "" or f_path == "." then
		return " "
	end
	-- e.g. from C:\Users\joene\AppData\Local\nvim\lua\statusline\pogacha\init.lua
	-- to lua\statusline\pogacha
	-- then format to some criptic form idk
	return string.format(" %%<%s/", f_path)
end

-- get the filename (only the name of current file)
function filename()
	local f_name = vim.fn.expand "%:t"
	if f_name == "" then
		return ""
	end
	return f_name .. " "
end

-- get information about current line in file
function line_info()
	if vim.bo.filetype == 'alpha' then
		return ''
	end
	-- percentage through the file
	-- line nr
	-- col nr
	return " %P %l:%c"
end

-- build the statusline
StatusLine = {}

-- take a table of string return by the functions and concat
-- them into one string, which the statusline will be set to
StatusLine.active = function()
	return table.concat {
		"%#Statusline#",
		mode(),
		"%#Normal# ",
		filepath(),
		filename(),
		"%#Normal#",
		"%=%#StatusLineExtra#",
		line_info(),
	}
end

function StatusLine.inactive()
	return " %F"
end

-- use an autocmd to show the statusline
vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
