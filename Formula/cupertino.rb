class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.7.0/cupertino-v0.7.0-macos-universal.tar.gz"
  sha256 "622a7727e6667d75799d09c4fb5a9cc160e8cff9a038c45d7148a638b209b686"
  version "0.7.0"
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
    assert_match "0.7.0", shell_output("#{bin}/cupertino --version")
  end
end
