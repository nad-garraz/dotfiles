local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local cmp_nvim_ultisnips_status_ok, cmp_nvim_ultisnips  = pcall(require, "cmp_nvim_ultisnips")
if not  cmp_nvim_ultisnips_status_ok then
	print("Problemas al cargar cmp_nvim_ultisnips.mappings")
	return
end

local cmp_ultisnips_mappings_status_ok, cmp_ultisnips_mappings = pcall(require, "cmp_nvim_ultisnips.mappings")
if not cmp_ultisnips_mappings_status_ok then
	print("Problemas al cargar cmp_nvim_ultisnips.mappings")
	return
end


local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp_nvim_ultisnips.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
 filetype_source = "treesitter", --"ultisnips_default"
  show_snippets = "all",
  documentation = function(snippet)
    return snippet.description .. "\n\n" .. snippet.value
  end,
})

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-l>"] = cmp.mapping(function()
			if cmp.visible() then
        print('Forward docs')
				cmp.scroll_docs(2)
			end
		end, { "i", "c" }),
		["<C-h>"] = cmp.mapping(function()
			if cmp.visible() then
        print('Backwards Dock')
        cmp.scroll_docs(-2)
			end
		end, { "i", "c" }),

		["<C-n>"] = cmp.mapping(function(fallback)
      print("Enter -> Confirm, ctrl+E -> Abort")
			cmp_ultisnips_mappings.jump_forwards(fallback)
		end, { "i", "s", }),
		["<C-p>"] = cmp.mapping(function(fallback)
      print("Enter -> Confirm, ctrl+E -> Abort")
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, { "i", "s" }),--[[ "c" (to enable the mapping in command mode) ]]
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			vim_item.kind = kind_icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				ultisnips = "[UltiSnips]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{ name = "ultisnips" },
		{ name = "nvim_lsp", max_item_count = 4 },
		{ name = "buffer", max_item_count = 4 },
		{ name = "path" },
},
sorting = {
    comparators = {
        cmp.config.compare.score,
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.recently_used,
        cmp.config.compare.length,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.order,
    },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	experimental = {
		ghost_text = true,
	},
})
