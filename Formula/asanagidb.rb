class Asanagidb < Formula
  desc "High-performance graph memory engine in Zig with native Z3 formal verification"
  homepage "https://asanagi.ai"
  version "2.5.1"
  license "Commercial"

  on_macos do
    if Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.1-darwin-arm64.tar.gz"
      sha256 "89407431b65f01841676b5afd4197a684090105ae94b9fd4e58d2990b737d1e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.1-linux-x86_64.tar.gz"
      sha256 "f7e3ae093d7101426f2898a37120a822241ad3c58073612afda5a7cc411aac2c"
    elsif Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.1-linux-aarch64.tar.gz"
      sha256 "3a9140e1c3aa5db18020cef5088b2d4b6944f91839f7095add5dc20a543ae6bc"
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
