class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.8.2/cupertino-v0.8.2-macos-universal.tar.gz"
  sha256 "e7caedefa7236bf7bb0aa7e9e2847d916dd46f24799d57f7725cdc13ec77776f"
  version "0.8.2"
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
    assert_match "0.8.2", shell_output("#{bin}/cupertino --version")
  end
end
