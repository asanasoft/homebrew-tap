class Asanagidb < Formula
  desc "High-performance graph memory engine in Zig with native Z3 formal verification"
  homepage "https://asanagi.ai"
  version "2.4.1"
  license "Commercial"

  on_macos do
    if Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.4.1-darwin-arm64.tar.gz"
      sha256 "cd16791b8031f8ec1f1d9e15e105194250d576fe8ee511802b3d4637e3af8306"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://asanagi.ai/downloads/asanagidb-v2.4.1-linux-x86_64.tar.gz"
      sha256 "f98cf219a736e72d1325b515df6f68a01a50fb9f5ce917bde5387cf7a9045349"
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
