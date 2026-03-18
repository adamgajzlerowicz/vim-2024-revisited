# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal Neovim configuration. All config is pure Lua — no external build system.

## Architecture

**Bootstrap chain**: `init.lua` → `require("adam")` → `lua/adam/init.lua` loads all modules in order.

**Module loading order** (defined in `lua/adam/init.lua`):
packages → startify → mappings → mason → lspconfig → formatter → luasnip → cmp → treesitter → settings

Each `lua/adam/*.lua` file owns one concern. Key relationships:
- `packages.lua` — Lazy.nvim plugin manager setup + all 48 plugin specs
- `lspconfig.lua` — Uses `vim.lsp.config` / `vim.lsp.enable` API (not the older `lspconfig.xxx.setup()` pattern). Capabilities come from `cmp_nvim_lsp`
- `cmp.lua` — nvim-cmp with sources: nvim_lsp (priority 1000), luasnip (750), buffer (500). Custom Tailwind color formatting
- `mappings.lua` — All keybindings. Leader is space. Mix of `vim.api.nvim_set_keymap` and `vim.keymap.set`
- `settings.lua` — Editor options + autocmds (auto-format on save, auto-scroll to last position, git auto-pull, session management)
- `formatter.lua` — stylua (Lua), gofmt (Go), trailing whitespace removal. Auto-runs on `BufWritePost`

## Target Languages

Astro/React/TypeScript (ts_ls, tailwindcss, astro LSPs), Go (delve debugger, gofmt, vim-test), Lua (lua_ls with vim globals)

## Key Conventions

- Formatters run automatically on save via `FormatWrite` autocmd — don't add manual format calls
- Git auto-pull from `~/.config/nvim` runs on `VimEnter`
- Testing uses vim-test with vimux strategy; Go debugging uses nvim-dap-go with delve
- Plugin lazy-loading: use `cmd`, `keys`, or `dependencies` fields — avoid `lazy = false` unless necessary
- Custom Telescope pickers live in `telescope-custom-picker.lua`
- Snippets (React component, console.log, className) are defined inline in `luasnip.lua`
