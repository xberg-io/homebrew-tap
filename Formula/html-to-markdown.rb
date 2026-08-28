# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.11.6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.11.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f6ae2c22276f1aba96bbd7dba9af34e8baf88ba44d30f734a0927a22b02f5721"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d606c5e6d4463237de701a5ee17eb3fe6b4610d9348cc09280f03f47725fb0b0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be466765d4ca22525854805af3599f9150d3972c549af136c6ad5e11a9a9715f"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "ffdb6149e80a34bcaea92fca0ea61bc957c8953df0623c04e992b905d92726ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58cdc01a0c46450dd5c7f16df13fa86bf24db178262ac38d5272575a3972797e"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4b6468a0a1854a94c315613f172ca52bffaa26a70d0a850bda9f277c9c8bd01"
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
