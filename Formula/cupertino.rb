class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v4.0.0/cupertino-v4.0.0-macos-universal.tar.gz"
  sha256 "cf035352f3fd45dd54c21cf60d9335754038a0ad09aafb7bf46ebd8a51ac0b40"
  version "4.0.0"
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
    assert_match "4.0.0", shell_output("#{bin}/cupertino --version")
  end
end
