local luasnip = require "luasnip"

local snippet = luasnip.snippet
local text_node = luasnip.text_node
local insert_node = luasnip.insert_node

local consoleLog = snippet("cl", {
  text_node "console.log(",
  insert_node(1, '"msg"'),
  text_node ");",
})

luasnip.snippets = {
  javascript = { consoleLog },
  typescript = { consoleLog },
  javascriptreact = { consoleLog },
  typescriptreact = { consoleLog },
}
