# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture

This is a kickstart.nvim-based Neovim configuration with a modular plugin layout managed by lazy.nvim.

**Entry point**: `init.lua` — sets leader key, loads `options` and `keymaps`, bootstraps lazy.nvim, and registers all plugins. Most core plugins live inline in `init.lua`. Optional kickstart plugins live in `lua/kickstart/plugins/` and must be explicitly `require`d in `init.lua`. Custom user plugins auto-load via `{ import = 'custom.plugins' }`.

**Load order**:
1. `lua/options.lua` — editor options
2. `lua/keymaps.lua` — global keymaps
3. lazy.nvim setup — inline plugins + `lua/kickstart/plugins/*.lua` (opt-in) + `lua/custom/plugins/*.lua` (auto-loaded)

## Custom Plugins

All files under `lua/custom/plugins/` are auto-loaded by lazy.nvim. Each returns a lazy plugin spec. Current custom plugins:

- **claude-nvim** — IDE integration for the Claude CLI (`ClaudeStart/Stop/Toggle/Status/Reload/Log`)
- **courier-nvim** — messaging/notification plugin
- **preview-nvim** — in-editor preview
- **gitdiff-nvim** — git diff tooling
- **cartograph-nvim** — (custom)
- **whiteboard-nvim** — (custom)
- **roslyn.lua** — Roslyn LSP for C#

## Local Dev Plugin Loading

Custom plugins use a dual-source pattern: load from a local repo if it exists, fall back to GitHub automatically.

```lua
-- lua/custom/local_dev.lua
local base = vim.fn.expand(vim.env.NVIM_PROJECTS_DIR or '~/Projects')
function M.path(relative) -- returns full path if dir exists, else nil
```

In each plugin spec:
```lua
dir = dev.path 'claude-nvim',  -- nil → lazy uses the GitHub 'Symphon-y/claude.nvim' source
```

**To develop a plugin locally**: clone it into `$NVIM_PROJECTS_DIR/<plugin-name>` (default `~/Projects/<plugin-name>`). Set `NVIM_PROJECTS_DIR` in `.env` (git-ignored, copy from `.env.example`).

## claude-nvim Plugin Architecture

Source: `~/.local/share/nvim/lazy/claude-nvim/` (or local dev path)

- `lua/claude-nvim/init.lua` — public API: `start()`, `stop()`, `toggle()`, `status()`. Holds `M._state` (the running session info) which gates all commands.
- `lua/claude-nvim/panel.lua` — opens a terminal split running the `claude` CLI. Sets `CLAUDE_CODE_SSE_PORT` and `ENABLE_IDE_INTEGRATION=true` env vars so the CLI connects back via the IDE SSE server.
- `lua/claude-nvim/ide/` — SSE server that the Claude CLI connects to, providing file context, selection streaming, and file-change dispatch.
- `lua/claude-nvim/ide/lockfile.lua` — writes `~/.claude/ide/<port>.lock` so the Claude CLI discovers the Neovim instance.
- `lua/claude-nvim/watch.lua` — attaches libuv `fs_event` watchers to all open buffers; reloads buffers when Claude edits files on disk. Also watches CWD recursively to refresh file-tree plugins (nvim-tree, neo-tree, oil).
- `lua/claude-nvim/config.lua` — defaults including `cli`, `panel.direction/size`, `system_prompt`, and `file_tree` options.

**Known issue**: When Ctrl-C kills the claude terminal, `panel.lua`'s `on_exit` deletes the buffer but does NOT clear `M._state` in `init.lua`. This leaves the plugin believing it's still running, causing `:ClaudeStart` to report "already running."

**Workaround**: Run `:ClaudeStop` (which checks `M._state` and properly tears down) then `:ClaudeStart`. If that fails, `:ClaudeReload` resets the full module state before `:ClaudeStart`.

## Windows-specific Notes

- Treesitter on Windows uses a `zigcc.cmd` shim (auto-generated in `stdpath('data')`) to remap the MSVC target to `x86_64-windows-gnu` so `zig cc` can compile parsers.
- `telescope-fzf-native` requires `make`; the `cond` guard skips it silently if `make` is absent.
- LSP installs (Mason) include `csharpier` and `netcoredbg` for C# development.

## Key Keymaps

| Key | Action |
|-----|--------|
| `<leader>cc` | Toggle Claude panel |
| `<leader>cs` | Claude suggest at cursor |
| `<leader>sg` | Live grep (filtered) |
| `<leader>sf` | Find files |
| `<leader>f` | Format buffer (conform.nvim) |
| `;` | Harpoon add |
| `<C-h>` | Harpoon quick menu |
| `-` | Open parent dir (oil.nvim) |
| `<Esc><Esc>` | Exit terminal mode |
