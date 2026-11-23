# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.23.1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.23.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ba799f4bd55eaf348c62df5f842c4b37875c476f8161b4bda71f32b8cacdd76e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "af59862f31e6bd610f3812213cf42341f3c7aabb01a64e35c99b6d6cfe043e29"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fbc68d52c76e076ebcbab5435b403c0c52f4455fc4b408b61bb5019869e510aa"
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
    sha256 "9cd59020566eb4eeefb50d6c632d2d1d5069d2bf0ad0f6cc7a1edafeaff7232f"
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e3e26804c0259384792f4d5127d102ab011132e118c5cf84b1eadc5807d2578"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ac85dfd20a2a9f4b72280ea500fa72490a976f35b0ed6174573695702b8c220"
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
