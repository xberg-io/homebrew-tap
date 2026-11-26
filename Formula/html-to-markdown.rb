# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.23.4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.23.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3b51cfc3611a4780d34936d130d7312c16c0ebaa1229d0c7c31045ea81c5acde"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e7d7a05378e32c9a0ceb66a71802815a61e323b7e92d4df59993151c25780132"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5fd736096450c58cae9bce2989500f3e97d8e026913eddb6c79b20ce4735a33b"
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
    sha256 "223aa7ebe8cc68257a8caeeb653ac05937f030fd361b3f9b8247227a8474aeea"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e0324a2c7fee155d383efcf5bf0dcb3f53eb7b2849ffd0f121390974c568ec2"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42c14b760417597b5b11b08bdcea1fccce6a209ac9a0caeb3a67314320534a6e"
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
