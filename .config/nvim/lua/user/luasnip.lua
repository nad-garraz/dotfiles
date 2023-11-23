local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = false,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " « ", "Error" } },
			},
		},
	},
})
