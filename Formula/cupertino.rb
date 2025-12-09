class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.4.0/cupertino-v0.4.0-macos-universal.tar.gz"
  sha256 "1cbc349f12fbfbfecb364c005a17e739d051b33777b8e7d48c3c7304fb0bda3e"
  version "0.4.0"
  license "MIT"

  depends_on :macos
  depends_on macos: :sequoia

  def install
    bin.install "cupertino"
    # Install resource bundle alongside binary
    (bin/"Cupertino_Resources.bundle").install Dir["Cupertino_Resources.bundle/*"]
  end

  def post_install
    ohai "Run 'cupertino setup' to download documentation databases"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/cupertino --version")
  end
end
