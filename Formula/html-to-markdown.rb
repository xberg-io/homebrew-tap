# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.8.2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.8.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "afb3d95b75d3f196dabc3ba7b27b5860142aef522238eb165474ef7e0b3c8f3c"
    sha256(
      cellar: :any_skip_relocation,
      arm64_sequoia: "e184418b27166527f0a9139bcc0564a24a1d1f6690f2af4b215e3f9c1974acd3"
    )
    sha256(
      cellar: :any_skip_relocation,
      x86_64_linux: "2c361011ed6d7ce42764ae9648b53b5bc11d68b53220038b18a53a19321a885a"
    )
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "e3dc4737dd24d58ff5c73ffba5b59857040fe10f5429bfdda1abec5c611113ff"
    end
  end

  on_linux do
    on_arm do
      url(
        "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      )
      sha256 "2c4790b47df1218fa26e07a39f7fa7e4bff4cee8fd4e288b7c501dff20be2a6e"
    end

    on_intel do
      url(
        "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      )
      sha256 "0bd8155dbe11d8d7b3aef014ca514e68093766c8353b4c7749a53ac8ac13a34b"
    end
  end

  def install
    bin.install("html-to-markdown")
  end

  test do
    (testpath / "test.html").write(
      <<~EOS
        <h1>Hello World</h1>
        <p>This is <strong>bold</strong> text.</p>
      EOS
    )

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match "Hello World", output
    assert_match "**bold**", output
  end
end
