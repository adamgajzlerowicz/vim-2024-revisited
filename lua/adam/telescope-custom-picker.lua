local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- Custom filter function
local filter_types_symbols = function(symbols)
	local filtered = {}
	for _, symbol in ipairs(symbols) do
		-- Ensure that 'symbol.filename' or 'symbol.location.uri' is a string before matching
		local filename = symbol.filename or (symbol.location and symbol.location.uri)
		if filename and type(filename) == "string" then
			if not string.match(filename, "__types__") then
				table.insert(filtered, symbol)
			end
		end
	end
	return filtered
end
-- Custom picker function
local lsp_symbols_excluding_types = function(opts)
	opts = opts or {}

	-- First, we need to get the symbols using the lsp workspace/symbol request
	-- This is an async operation, so we need to provide a callback function
	vim.lsp.buf_request(0, "workspace/symbol", { query = "" }, function(err, result, ctx, config)
		if err then
			vim.api.nvim_err_writeln("Error fetching LSP symbols: " .. err.message)
			return
		end

		-- Filter out symbols from __types__ directories
		local filtered_symbols = filter_types_symbols(result)

		-- Now we have the filtered symbols, let's create a Telescope picker to display them
		pickers
			.new(opts, {
				prompt_title = "LSP Symbols (excluding __types__)",
				finder = finders.new_table({
					results = filtered_symbols,
					entry_maker = function(entry)
						return {
							value = entry,
							display = entry.name,
							ordinal = entry.name,
							filename = entry.location.uri,
						}
					end,
				}),
				previewer = conf.qflist_previewer(opts),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						local selection = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						-- Here, you can define what happens when you select an entry
						-- For example, navigating to the symbol's location
					end)
					return true
				end,
			})
			:find()
	end)
end

return lsp_symbols_excluding_types
