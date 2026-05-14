# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "365af2a564669f62be82005dd3ccf002d421c1e82185acfda31b07920646b412"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7d0dd756e414702317db5ceaba9c567c1557c9607e32341f9a8a3fdbd3daf453"
    sha256 cellar: :any_skip_relocation, sequoia: "b222dab41fe84998672033204feb9bbe63383c6b0d379bbb4e150ca7ef3c6207"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aebcab80deccf557ab74dbb774385c409e148afa58bb154cd06935aa618724ca"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "53096cbe436d7253af65a75151947038ea6073c282313e60556d85ed1d995e28"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "0a0190f5c1ade34ecc80c680716076d5be28fbebc05d9538707dfc598764c339"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "540b609b9a4ff49e1fe885ad91579509f44b97aceb311097e406d680f60dc7c9"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e6d3284fc767bfbf5b4c4ef88be6435a040bbd115f4d9fa9e3a41f056d05144"
    end
  end

  def install
    bin.install "html-to-markdown"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
