class Asanagidb < Formula
  desc "High-performance graph memory engine in Zig with native Z3 formal verification"
  homepage "https://asanagi.ai"
  version "2.6.0"
  license "Commercial"

  on_macos do
    if Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.6.0-darwin-arm64.tar.gz"
      sha256 "4e14b1acd14f35c3d0f601505f8b97f32cd5523dde61cd9a1546a4c253fb6e1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://asanagi.ai/downloads/asanagidb-v2.6.0-linux-x86_64.tar.gz"
      sha256 "2a90779d2ed0e0ffc87400ac12ede11d8192ccb9cbe908cc9972bee064c3d914"
    elsif Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.6.0-linux-aarch64.tar.gz"
      sha256 "6efad0a3ad295821afd0935018f5151bc77d8ca5370e531853bb28142d35ef38"
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
