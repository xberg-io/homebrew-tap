# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.21.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.21.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "3eed7b006471284c51c6314c61bbc6eda59e7fb2e28a1a83d32122f6d129ff05"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "48009fde3e124130d82bc12c0518c95c9c2a77b12e783b8ddf4d7c3a4ba6ebf8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "642caff00d34a881dd0cc257c8dcde4399d82bddfebb6b851e84150e13edd7a0"
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
    sha256 "eb4f44b01ee58cb52cc84a5089476ab05cc33ed9867637aac58baacbb8645115"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f856b052bf5b4a01bf412c07c99b14e37956f81efaa201f1dd679a5991e97c01"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8068009859ab575625bcd83c9f0ad21f9710923daa65cd18bfb8ba65df2568b"
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
