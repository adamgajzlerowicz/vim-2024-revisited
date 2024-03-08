local luasnip = require("luasnip")

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

local consoleLog = snippet("cl", {
	text_node("console.log("),
	insert_node(1, ""),
	text_node(");"),
})


local reactComponent = snippet("cc", {
    text_node({"type Props = {", "\t"}),
    text_node({"", "}", "\t"}),
    text_node({"", "function Component({}: Props) {", "\t"}),
    insert_node(1, "return"),
    text_node({"", "\treturn (", "\t\t<div>", "\t\t</div>", "\t);", "}"})
})

luasnip.add_snippets("javascript", { consoleLog, reactComponent })
luasnip.add_snippets("typescript", { consoleLog, reactComponent })
luasnip.add_snippets("javascriptreact", { consoleLog, reactComponent })
luasnip.add_snippets("typescriptreact", { consoleLog, reactComponent })
