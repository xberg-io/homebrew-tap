# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.0-rc.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "Downloading cli-aarch64-apple-darwin.tar.gz...
ec9da87b571c876a30df8152eda13278443085b026dec103edb6130bd0f522ec"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "Downloading cli-x86_64-apple-darwin.tar.gz...
90e6c211a06cc5cb992b9e9470c7052167ee75726786fd9430b034451a42b7e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "Downloading cli-aarch64-unknown-linux-gnu.tar.gz...
e93007c8e8b8f9cc2ec3e5321936c0cb46098daf886fe748303d617ddade0f19"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "Downloading cli-x86_64-unknown-linux-gnu.tar.gz...
aaa553d1f81e5946105d92fee23cb58d49b6bc91e17f58c47d38dd5609ad454a"
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
