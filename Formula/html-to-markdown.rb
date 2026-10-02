# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.16.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.16.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "0129263daee5c03201f2ec91a9d785e9e33169ee58b2db5bf11f41ba22fe93e7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2441707111aec9071181680f7974d53cb9c2874abb7e58357e4cff0f361faabd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9b9a8f5ba345e9a89895dc4d09b83a990ead982d5938d10cd000b74c3b8dae4e"
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
    sha256 "ccecf07ecd60d9033f7abe1541422f474d52834cd242de839645587cb9e39c82"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0aa9c54706f79df10cbfd7b717f43f11f0943386c68b5578436da5bb298a348"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae2bdae77408c419e23446b06ea4f30cb05f22358a5bf6823a30ee6031c5585d"
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
