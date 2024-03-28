local cmp = require("cmp")

local function luasnip_filter(entry)
	local source = entry.source.name
	if source == "luasnip" then
		local current_input = vim.api.nvim_get_current_line()
		local snip_text = entry:get_completion_item().label
		if not snip_text:find(current_input, 1, true) then
			return false
		end
	end
	return true
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = cmp.config.window.bordered({
			winhighlight = "Normal:MyCmpHighlight,CursorLine:PmenuSel,Search:None",
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = nil,
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 2, filter = luasnip_filter },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
	}, {}),
})
