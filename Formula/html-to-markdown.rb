# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.20.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.20.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e3ad2d9c3cbb26c31b05b749a89e347861387f77f7fa9e7808104520c04b3396"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bef1977ed2c44033e9260bee0198dcaa1874fc67054058d2fc6ebf54124a24f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ecf8374829af0f394b3ccdc55a2877e6941d2baf726befdabef1f21fe00f74cc"
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
    sha256 "0fa7743d94df7d65875e79fa3c545af36f26f134457cfbfe7a2514c7ee90af10"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56299ada58958be2712cde57df96ea2cf063e1ee24bbd223999b481f509b7893"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0641c8dbbbf99141d7d3ae6fbae073f3f0c40f26028436ff70ba14606b5c365a"
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
