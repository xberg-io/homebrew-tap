# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.11.4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.11.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "786980415e2e7643d1af631fcdf3d858b5c83f45488d60f561df23a097ded258"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6999635b8c6733f3e4b5644e7f66f8c77a0f5f38f574b9d888f4ffe1c3588dd2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5a16fa01b601011b2c35cf28d133e7654c53acc4e02cf4f750a7d9c8a61534f6"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "ec8a21d2e17054daeb06b00b70a9e552943d74f7d378729ac310b638509fb2e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21392de281a8a1205cdb5c970d044b2ef7da993ce6c5a974027e9459926ce3dd"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "01bc001f3c7b41909f1773aedb59a29b6ff830569214cf8c1c9c3f7caf25102e"
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
