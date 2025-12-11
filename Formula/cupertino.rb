class Cupertino < Formula
  desc "Apple Documentation MCP Server - Search Apple docs, Swift Evolution, and sample code"
  homepage "https://github.com/mihaelamj/cupertino"
  url "https://github.com/mihaelamj/cupertino/releases/download/v0.5.0/cupertino-v0.5.0-macos-universal.tar.gz"
  sha256 "9eac5e49e5c5497afb3c14da96740db1968249433bd913102891d65cfe6b6fa0"
  version "0.5.0"
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
    assert_match "0.5.0", shell_output("#{bin}/cupertino --version")
  end
end
