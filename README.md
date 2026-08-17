# Homebrew Tap for AsanagiDB Suite

Official Homebrew tap for installing the **AsanagiDB** suite on macOS and Linux.

## Included Binaries

- **`asanagidb`**: High-performance graph memory database engine in Zig.
- **`asanagidb-mcp`**: Embedded Model Context Protocol (MCP) server.
- **`asna`**: Command-line administration & query utility.
- **`asanagidb-admin`**: Desktop administration GUI.

## Quick Start Installation

```bash
# Add the AsanaSoft tap repository:
brew tap asanasoft/tap https://git.asanasoft.com/alopez/homebrew-tap

# Install the AsanagiDB suite:
brew install asanagidb
```

## Quick MCP Setup (Claude Desktop / Cursor / Antigravity)

Add the following to your `mcpServers` configuration:

```json
{
  "mcpServers": {
    "asanadb": {
      "command": "asanagidb-mcp",
      "args": ["--db-path", "~/.asanagi/memory"]
    }
  }
}
```

## License Activation

To request or activate your free community license, visit [https://asanagi.ai/#license](https://asanagi.ai/#license).
