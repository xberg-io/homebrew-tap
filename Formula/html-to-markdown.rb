# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "533e926ac1d3b60b17dcb85b78456cb327354916017f90deb049d477e4dbe199"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3df86481350c27ae2212e9ef7ce56998470665c4841e0343d411690cc35a8af3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "77830e9d6f0aa7f423fe72ff876625c665f281a50411be0d464526618e6aa205"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "908e6b077a48f985e836efdc9cdfad12a45efba70cfb0f25093cbffef28cd736"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "654f2d6e9a4ca95c9ca2b635299dbdca57fe5c17cf777adfb541e319b379c938"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77358af0a9d4709c436234290a73db2c1202497e752aa785fa239a0be37e9eba"
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
