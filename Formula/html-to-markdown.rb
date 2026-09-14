# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.13.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.13.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "36d87a66bd091b68cccb7b2cba9aa5fb508a4b32440554c057fe3869dfa3b243"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a4f35766e21335392f011deae2d121dded32df3be71e253e8838bf472003ac8f"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "3094f76d99cb56d87a2a12a2546c1b8a438eb507e9374a9ec97f0d61a2557c16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfa7fffce108b64892c5d8f79cf5151c51bf4d498b92143073d17940e54c2ee8"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89dbcb4b61a1d9c53de9760fb56b59f20cb0770eb37830e20ce1ee91b92e35d0"
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
