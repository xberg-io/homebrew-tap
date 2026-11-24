# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.23.3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.23.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dad9133a23a13e2cae5ed2bfb09e847c1aae156abf0445536fca6e0d1d7fd8dd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d051b0c9561cc65ea19ac7c32111c2a7e2109c273f2066deffde4e31c6f3e17c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1b48b0a42f708d1b64f09996b86313dfedde68b8331a0f6354f5d6f6773ad39c"
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
    sha256 "b3e03046bcd2ad107c3fcd4fc0499b2ee6d553f93b31f077d5f365ccce4fb913"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b98f3ca2d427c5cd7863f629b737c0d3c7dae66424be3a9aa74261d92429452"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdc3d2bb4b79e25b78bfecb39eb260a09872ba07b62851045bf1abe85a83428b"
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
