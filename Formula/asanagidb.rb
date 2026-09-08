class Asanagidb < Formula
  desc "High-performance graph memory engine in Zig with native Z3 formal verification"
  homepage "https://asanagi.ai"
  version "2.0.0"
  license "Commercial"

  on_macos do
    if Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.0.0-darwin-arm64.tar.gz"
      sha256 "8ae9678c0aa9cd6aeafc382776806c0ad6a28f5b43c5ec89b9e551277e9c44f3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://asanagi.ai/downloads/asanagidb-v2.0.0-linux-x86_64.tar.gz"
      sha256 "780b19747e0a36ec93dfede4d047efd2ed4c8a908522e3471cbce552fafd96a8"
    end
  end

  def install
    bin.install "asanagidb"
    bin.install "asanagidb-mcp"
    bin.install "asna" if File.exist?("asna")
    bin.install "asanagidb-admin" if File.exist?("asanagidb-admin")
  end

  def caveats
    <<~EOS
      AsanagiDB Suite v#{version} installed successfully!

      Binaries available:
        - asanagidb        (Graph Database Engine)
        - asanagidb-mcp    (Model Context Protocol Server)
        - asna             (CLI Admin & Query Utility)
        - asanagidb-admin  (Desktop Admin UI)

      🔑 Community License Setup:
        To request or activate your free community license, visit:
        https://asanagi.ai/#license

      🤖 To configure asanagidb-mcp with Claude Desktop, Cursor, or AI agents:
        Add the following to your mcpServers config:
        {
          "mcpServers": {
            "asanadb": {
              "command": "asanagidb-mcp",
              "args": ["--db-path", "~/.asanagi/memory"]
            }
          }
        }
    EOS
  end

  test do
    system "#{bin}/asanagidb", "--version"
  end
end
