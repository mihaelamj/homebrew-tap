class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.6.0/cupertino-v0.6.0-macos-universal.tar.gz"
  sha256 "ba8a23a91d396bff7845a62fb375cbc57852518db7fbb68ef1bd14726666b1f4"
  version "0.6.0"
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
    assert_match "0.6.0", shell_output("#{bin}/cupertino --version")
  end
end
