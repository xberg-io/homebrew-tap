# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.12.3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.12.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2bdadf9c1df668f56328de00270c16f026a43ec70e05050c3423d5d1884a648f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cb13ef8be981f023402969c053ed03eaad26ecc45fbbec4cca12817b88ec8ac0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a8126154dd4717fd0beb1cf8992858c22eed44ac4ba6f7ba10fcd99515e3e931"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "c48571c9d213d24144bf4cf2cf04b602839e4c0a682d7bf76044371b31a5bc6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "390685e0cb8c97139c715655d68b2a36f579710a26c66cc05e3f7a81908e6d16"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3b5531a986119798c046cdfd10add75bf80d5991c771722d278fc0e44682544"
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
