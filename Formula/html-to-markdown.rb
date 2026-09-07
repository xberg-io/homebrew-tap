# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.12.1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.12.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b5477951a574611049c2af8fe6a94a1d4a61a681b9cfbb633143f29ac539d7d4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "173a06012b301a0f134488ede501939be8998d1a194d196b341ed72544c742c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb6eccefedf41378965f3d346570144eac0ccb1d04dd2bd592f0aef422394f4b"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b9d2049016de9c1d25c815ed8a561c462829108b1681d89827b3f95cd5d248f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "baba5f842135bea7f252a138c8431d48a4f76941b53239868215f50b828ea122"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f4a67d739b35d1e1393c83dd24f163064fcbaaa830d13987889ffad95557672"
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
