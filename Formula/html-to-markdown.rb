# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.9.1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.9.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f1858e0678b39f557218f81721f510236873af60848fcd7473be8b850e917324"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "95f7e08b5626001ad698f5c21deee8b582244af09f1fbfe8eaf227af4fdb406e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e46b3a7d0e80d5bd98195dae9c90af5c973a0500e1829553b267763353531b9b"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "4fff44d856d1657da592e2d28735aa68d153d2dce66b73e5b06d6a7e902a5140"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfa9b026c55611c7e839f8bfbabd50c5ef767ba913535798fa17ec0ee3173775"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "729b09d802c593a5afede0889eab4e77360fba4d4b7f34ca83424addd1d1b29f"
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
