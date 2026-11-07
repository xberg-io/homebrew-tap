# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.21.2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.21.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "edeb90c15ea3cfd12560f3744161e0167259c806cf799056d168bc2b3ebda7cf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a473913ad71c7e361f627d9e50e377b1e33f6630daf8500b187a5b9782f7c2e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a2be9eec8b43319f4372eb586ba40b86cb219ebaf5c9f68b929f1706872dda14"
  end

  # macOS is Apple Silicon only -- the CLI no longer ships an x86_64-apple-darwin build.
  # The url MUST stay at on_macos scope rather than inside an on_arm block. Homebrew
  # validates a formula under EVERY os/arch pair, so an Intel-macOS simulation that finds no
  # url at all fails with "formula requires at least a URL", which `brew tap` then reports as
  # "Cannot tap xberg-io/tap: invalid syntax in tap!". One unreachable platform on this one
  # formula made the entire tap untappable for everyone and blocked every bottle build in the
  # org (alef 0.89.0). `depends_on arch: :arm64` is what refuses an Intel install, with an
  # accurate message. Check with `brew readall --os=all --arch=all xberg-io/tap`.
  on_macos do
    url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
    sha256 "6f2bc26e2362c20ec97c3a770986144f5ec13f9145bb4a7b3d184fa9da7f149d"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b43692387d3d02d10a58c4a7ab0ec3347ee735fdf3fe715ba813d864982c152c"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "443e663c4b62c151d4a6179d246ddef6a870f2720c176328524b4332e3add804"
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
