# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.23.4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.23.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e54d246e99c74c0fc535f3170740b02ac5abae3060e38004d994d52c28948940"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "68c61f70e73204f3a8293a5c31989c66339ef97bee0c3ec4c5375a7fb6dc06c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3035f8a8c022e5f54952facc899edc4383f4b759ccd1337dc8fb8893176e511"
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
