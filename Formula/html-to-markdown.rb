# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.22"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ec6fcac14e48ba3556047da2f698e45fa23027adeb4911810afa2a1ef6ce35ed"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "604a8a4daadbc2f667f909c5224bc180b8602481dc2d4adb64f269b0866d7269"
    sha256 cellar: :any_skip_relocation, sequoia: "b2db3ae0f8f2ac62b22f0d9252e307659cfd4a3611f32eb457d483ba42b8a111"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1695881502620406a5f5ad6d596311dac2725e039d7899a3d5fad81940b4c84a"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "fd0b2d82855c7bfc4204d0fb638b8a834770523b7a68072aed168751ad69d7bb"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "f5e3cb1fc28adc2c77afbb548e81df3af44f0d3e0d047c76ec5bcd7dca9b0c34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1d4693b75a55101d2e718bf102dc53677d1ecaaf4485cd018af84c8f210a43b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d12e7380dc6533b1a877649610983d72f8a6334190fe948206ad73261e69e90f"
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
