# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a Neovim configuration using Lazy.nvim as the plugin manager. The configuration follows a modular structure:

- `init.lua` - Entry point that loads the lazy plugin manager and sets basic Vim options
- `lua/config/lazy.lua` - Lazy.nvim bootstrap and setup configuration
- `lua/config/plugins/` - Modular plugin configurations, each file returns a plugin spec table
- `after/ftplugin/` - Filetype-specific configurations that override defaults

## Key Components

### Plugin Management
- Uses Lazy.nvim for plugin management
- All plugins are configured in `lua/config/plugins/*.lua` files
- Plugin specs are imported via `{ import = "config.plugins" }` in lazy setup
- Lock file: `lazy-lock.json` tracks exact plugin versions

### Core Plugins
- **LSP**: `lsp.lua` configures lua_ls, ts_ls, and jsonls with auto-formatting on save
- **Telescope**: `telescope.lua` fuzzy finder with ivy theme, includes fzf-native extension
- **Treesitter**: `treesitter.lua` syntax highlighting with performance optimizations for large files
- **Mini.nvim**: `mini.lua` provides statusline functionality

### Key Mappings (from init.lua)
- `<space><space>x` - Source current file
- `<space>x` - Execute current line as Lua (normal mode)
- `<space>x` - Execute selection as Lua (visual mode)
- `<M-j>` / `<M-k>` - Navigate quickfix list (next/prev)
- `<leader>fd` - Telescope find files
- `<leader>fh` - Telescope help tags
- `<leader>en` - Edit Neovim config files

Leader key is set to space (`<space>`).

## Development Workflow

### Testing Configuration Changes
- Use `<space><space>x` to source/reload the current Lua file
- Use `<space>x` to execute individual Lua lines for quick testing
- Restart Neovim to fully reload plugin changes

### Plugin Management
- Add new plugins by creating/editing files in `lua/config/plugins/`
- Use `:Lazy` to open the Lazy.nvim interface
- Run `:Lazy sync` to install/update plugins
- The configuration disables automatic change detection for performance

### LSP Development
- LSP servers auto-format on save when formatting capability is available
- Lua LSP includes vim API support via lazydev.nvim
- Error messages show if no formatter is available for a buffer

## File Structure Patterns

When adding new plugin configurations:
1. Create a new file in `lua/config/plugins/`
2. Return a table with plugin specifications following Lazy.nvim format
3. Include dependencies, configuration, and key mappings in the plugin spec
4. Use lazy loading when appropriate (ft, keys, cmd, etc.)

Filetype-specific settings go in `after/ftplugin/<filetype>.lua` (e.g., lua.lua sets shiftwidth=2 for Lua files).