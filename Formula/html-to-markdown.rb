# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.12.2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.12.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6c387e9c8f81c6d3fa9541cccec015fc12b0d71b8906db39197b885e6188961c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e835813313bbc43e2d484c484d7e18860f2c8fb6cbf5a5e2cce7b9f6b51f7104"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b2c53ef6ec4efbf88a7ff3be1f04fdc05f87eba81bf740c988f40a2fd0d593a1"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "18d48d1473ca587e0f7726228bc51ba1a6355aab65038a58b0a3d4b0c8499940"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a38fe950eba6d4b44fe6214d5c2237f741d93e013c0f8fb961d2412e8ae351a"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a380d2c6462fd282019ca25073b3b66e8e843e813b4d35d100303a2d4463e1b"
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
