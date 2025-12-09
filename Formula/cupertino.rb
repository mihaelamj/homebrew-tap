class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v4.0.0/cupertino-v4.0.0-macos-universal.tar.gz"
  sha256 "5c5cf7ab3dba6ee2924e59aaf8c4b57a57839142abda5cf88808ad9aec8c99b1"
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
