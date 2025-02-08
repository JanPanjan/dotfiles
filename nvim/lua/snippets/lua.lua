local ls = require 'luasnip'
local s = ls.snippet
-- local t = ls.text_node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta
-- local rep = require('luasnip.extras').rep

return {
	s({ trig = 'sa', regTrig = false, wordTrig = true, dscr = 'basic text snippet.'},
		fmta("s({ trig = '<>', regTrig = false, wordTrig = true dscr = '<>'}, { t('<>') }),", { i(1), i(2), i(3) })
	),

	s({ trig = 'sb', regTrig = false, wordTrig = true, dscr = 'auto-snippet template.'},
		fmta("s({ trig = '<>', regTrig = false, wordTrig = true, snippetType = 'autosnippet' }, { t('<>') }),", { i(1), i(2) })
	),

	s({ trig = 'sd', regTrig = false, wordTrig = true, dscr = 'text snippet template z delimiterji.'},
		fmta([[
				s({ trig = '<>', regTrig = false, wordTrig = true, -- snippetType = 'autosnippet',
					dscr = '<>'},
					fmta('<>',
						{ i(1)<> })
				),
		]], { i(1), i(2), i(3), i(4) })
	),
}
