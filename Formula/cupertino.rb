class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.3.4/cupertino-v0.3.4-macos-universal.tar.gz"
  sha256 "14c5547471fbda671d8f86d50746f33ed7375bb03d17ff5a550c110adc35671f"
  version "0.3.4"
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
    assert_match "0.3.4", shell_output("#{bin}/cupertino --version")
  end
end
