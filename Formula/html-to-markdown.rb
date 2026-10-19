# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.18.3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.18.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5b5e895996080bb77745e4f9d8fcab379abe818387558205f98a2e2af1b5f206"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "17ad81f9262eab65ed3e36defd549ca6d06907133efeba31f90da77a9df6bd2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d15e840f2b44a9223ceffc52595d8519856cbd3e195c594f42dbef9f22f8ad2"
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
    sha256 "584a86e312fcc62a0f3aa28a4d6bd694fd0b781db9d0972ab147d32be070563b"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b961a3f94a803256260ea2a2e7bda0660cc5d698a426737d688180a75c59f2e9"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90d108545ffe067dd2409044f67510be60e7523871114fd9f7c62617e3f08804"
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
