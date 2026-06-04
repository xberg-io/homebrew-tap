# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.11"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.11"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4be60227ed27d39a08dc6af35714208c669997090039f33bc9687fad60e5b9f8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f21e28693e9d5e5869fcc12a565a0b33a7f8cafc1caac1ee5854ae0d1ddc61e"
    sha256 cellar: :any_skip_relocation, sequoia: "7dfca36975876d3f141faa0c626dc8939180cf0da564c6d223b2a5570cb4ee55"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53e0b8ea5136b1f7a5c26554a077aedad7de3d17ad6764cc94d76ee638fad754"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b91d99f8da1b429cda2a12c3b9ad3a52369c06acf5e76d699bb255114d8f9dd1"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "85dcfd1e463689189d591ae5251ada7c81bbbfcea556f4f77c715b26b48e69d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29fced17cf5303e69c202684fa678bb80ab30b0fb70578eb417ec302d8a3a5d2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f5a33e7f33c257fddcafd1a2da4889587a09173b7d59eea5a68f0c5587d7f6c"
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
