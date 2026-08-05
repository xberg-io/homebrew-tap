# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8d5c26d1da43532f2fd5db6982b356be86c377e62d6dd93f286aa0fc48439902"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fbd4b29eb1c8c34d75885eb2ac501c8eb06d5db617d246671ecaa197d171b968"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a1b2955917b2f3cb0634057f6c5ae41608c3f9031592470d433acf680cf8055"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "0ceeb932c17e6c5d0d81ed17a07707d258afb401a3e2c742b60e48882d539124"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8222b0f7d8e27a4daa706aa964a658a5378422de37355b760fcdec77a8adc4e5"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "897beb1cf5ec467412aa35409eac3444297294be7c75ba3e428314ca1568d9b7"
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
