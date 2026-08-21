# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.11.3"
  license "MIT"

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b6bccbf7aab6ec6984f7c71fb056303e362fd55970599d9ab60dce4dc2c4a799"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f017724bf4237610df66816253250d67d072f0ffdbfe3b3cae2aeb952b8a3aa6"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5357b37319e971a5d7815f4237f271558ba1c80111cfbf7777b5fb4f8d66bc25"
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
