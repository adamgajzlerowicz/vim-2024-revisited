local cmp = require("cmp")
local lspkind = require("lspkind")
local function formatForTailwindCSS(entry, vim_item)
    if vim_item.kind == "Color" and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
            local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
            local group = "Tw_" .. color
            if vim.fn.hlID(group) < 1 then
                vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
            end
            vim_item.kind = "●"
            vim_item.kind_hl_group = group
            return vim_item
        end
    end
    vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
    return vim_item
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
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750, option = { use_show_condition = false } },
        { name = "buffer",   priority = 500 },
    }, {}),
    formatting = {
        fields = { "abbr", "menu", "kind" },
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 200,
            ellipsis_char = "...",
            before = function(entry, item)
                local fallback_name = "[" .. entry.source.name .. "]"
                local menu_icon = {
                    nvim_lsp = "[LSP]",
                    luasnip = "[snip]",
                    path = "[path]",
                    emoji = "[🤌]",
                    nvim_lua = "[api]",
                    calc = "[calc]",
                    buffer = "[buf]",
                    cmdline = "[cmd]",
                }

                item = formatForTailwindCSS(entry, item)
                item.menu = menu_icon[entry.source.name] or fallback_name

                return item
            end,
        }),
    },
    sorting = {
        comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.offset,
            cmp.config.compare.order,
        },
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
})
