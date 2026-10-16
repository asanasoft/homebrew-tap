class Asanagidb < Formula
  desc "High-performance graph memory engine in Zig with native Z3 formal verification"
  homepage "https://asanagi.ai"
  version "2.5.2"
  license "Commercial"

  on_macos do
    if Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.2-darwin-arm64.tar.gz"
      sha256 "6cdaa333ec0fc54df280a2e41697975a1fbce0551e5df703131710bb4e4e377d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.2-linux-x86_64.tar.gz"
      sha256 "826eaa41bc7e88a15a0247a80ad9dc015463c7c02b7b55f805c565f3e9f012fa"
    elsif Hardware::CPU.arm?
      url "https://asanagi.ai/downloads/asanagidb-v2.5.2-linux-aarch64.tar.gz"
      sha256 "32679b0b349dd716067e4de846b0c5757c47a38762f3fb10b793221ef3322eb8"
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
