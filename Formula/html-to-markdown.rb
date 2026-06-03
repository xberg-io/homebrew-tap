# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.8"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4e9a9139fab2948ae1e789524ab38f54dfc9fb123c2f9bc8ec8ecea954a70648"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "04832825b479acbed2151b0d7604d87500053d6521ee559a1a9ebc753027e3ac"
    sha256 cellar: :any_skip_relocation, sequoia: "66b0b8454a5faf7a327f210f272c63388dc2bece9f5396ecd8284a2f337a754d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8feb29a0f9a42e77256689855a3e08b32a3aef920d79b1fb602c2333a7be3cd9"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "a81d31004bf5feed2bdfdd28b333573e9473d1c76c14ab054abd9d8ca1eecf1f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "2d943d48b6df5ecfb89b652e4501912bf6775792c7300a5435ca9ae4af633952"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a5c94560f7992cbff839ff6000c8b02055e0ddcd7c98d05b7dee5920234e6e2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c52732aacc8463e2e9a80d3ccea50bd5c5c5bd739178df1d738bb49bfd5fc8b"
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
