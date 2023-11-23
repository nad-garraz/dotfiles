local ls = require("luasnip") --{{{

local s = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local date = function()
	return os.date("%d/%m/%Y")
end
ls.add_snippets(nil, {
	all = {
		s({
			trig = "fecha",
			name = "Fecha",
			desc = "Fecha en formato dd/mm/yyyy",
		}, {
			f(date, {}),
		}),
		s({
			trig = "todo",
			name = "todo",
			desc = "Todo al que hay que agregarle el comment según el lenguaje",
		}, {
			t({ "===================", "TODO " .. date() .. ": " }),
			i(1, "<TODO-STUFF>"),
			t({ "", "===================", "", "" }),
			i(0, "<Sigo por aquí>"),
		}),
	},
	javascriptreact = {
		s(
			{ trig = "aff", name = "Little Arrow Func", desc = "Just produces a () => {\n} " },
			fmt("const {iNode1} = () => {{{iNode0}\n}}", { iNode0 = i(0, "body"), iNode1 = i(1, "FuncName") })
		),
		s({
			trig = "div",
			name = "div",
			desc = " div tag with classname and closing tag",
		}, fmt("<div className='{iNode1}'> {iNode2} </div>", { iNode1 = i(1, "CLASSNAME"), iNode2 = i(2, "CONTENT") })),
		s({
			trig = "htag",
			name = "htag",
			desc = "generic HTML tag",
		}, fmt("<{iNode1}> {iNode2} </{}>", { iNode1 = i(1, "CLASSNAME"), rep(1), iNode2 = i(2, "CONTENT") })),
		s(
			{
				trig = "htagc",
				name = "htagc",
				desc = "generic HTML tag, with className attribute",
			},
			fmt(
				"<{iNode1} className='{iNode2}'> {iNode3} </{}>",
				{ iNode1 = i(1, "TAGNAME"), rep(1), iNode2 = i(2, "CLASSNAME"), iNode3 = i(3, "CONTENT") }
			)
		),
	},
})