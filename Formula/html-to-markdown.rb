# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.22.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.22.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "51a79919069d39de4a736e71c7bfbf0b37f20ef50ef48077cbe5533d5e4efc3b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "76a75d97bb36d069774c6057c24711dcdeeab4ca40ecff5aa353529808c87cee"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c8572172077f2284cad196daa4593c31f21dc70208c4d3d7f8bb9754837e0c9f"
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
    sha256 "ac44f04b9b20538909cc65c912f16b90f947198522b33203c14ea2a0ca3133f6"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63ebcff607f34be63cbd6dc94bd21cc828dc7667282077bcc40f40c32846c474"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "598fd1f56a096a9d667129ecbc25ff70c727e1d3fbd63f703db7eaba7aaa847e"
    end
  end

  def install
    bin.install "html-to-markdown"
    bin.install_symlink "html-to-markdown" => "h2m"
  end

  test do
    (testpath / "test.html").write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
    assert_equal output, shell_output("#{bin}/h2m test.html")
  end
end
