# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.9.2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.9.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f86a25923041868d4dc5c3e8bc6614a2c39dda9a478a89de92d769c6012becd7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "23b134bb14cf22f0e1c4923e9b0e9a9eb36d6f2d74ab0a3da51d447b4c802b5d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9d1e3dcbe5763a234344e047bc232c59a58ebecddb70647dfe40eb6916a04f30"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "8e337bd177560ab6f330bb72e7881a9acb28952aff6da3b20ca5aaa63dec7a4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a923d5eb0e116f3bd2d7c4bb01a9a6b3b564dc218f310cba6ea20df5f35be8e"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65ed839ff03095c48f5322e55c032bac859763f8a1aa93f4dae806694552eabb"
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
