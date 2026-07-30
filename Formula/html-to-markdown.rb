# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e658a30a8a8f9adfe198e65ecfdaf9dceb1eaffeaa2b2b25dddd2a860f5c529c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4865bcd733cd2f72a4a4f6e9f47304a603293c64ef366cd3b60d0768adddd9b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3761e185c3a7f1f1be4dc8f7d8677e2c256ca6e1a8dabc2cb14a35d88186e564"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "f8fc52ac086bb28f3d2b491ba50e3dce9109013681dc061b700e98e3d2077269"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49f1eb63bbc0b2504442839ab3ea975662bf5b512a6a9989b7708b34f6c2f341"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d82a4aaff2a2aebf66ad4fe0fd8c8aaa81f4a43dcc596a025b6b98d19580942"
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
