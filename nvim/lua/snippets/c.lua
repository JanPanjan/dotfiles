local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

return {
	s(
		{ trig = 'base', dscr = 'include stdio.h in main funkcija z return 0', regTrig = false, wordTrig = true },
		fmta(
			[[
#include <<stdio.h>>

int main() {
    <>

    return 0;
}
]],
			{ i(1) }
		)
	),

	s(
		{ trig = 'fop', dscr = 'ustvari file pointer za file, ki ga hočeš prebrat', regTrig = false, wordTrig = true },
		fmta('FILE *file = fopen(<>, <>)', { i(1), i(2) })
	),
}
