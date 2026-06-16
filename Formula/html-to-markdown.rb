# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.10"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.10"
    sha256 cellar: :any_skip_relocation, arm64_linux: "27d8d4f251a8baf7a602743940d69558c4edee607a30308dc7b618abfa36eae5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a93b8a9b33b97c0bdf6267846417d4c0851b2786f259361788054d86004aaf54"
    sha256 cellar: :any_skip_relocation, sequoia: "afc42b362adca13dcfc5310998167700cfdcd4251914eb5d66261d6fcb855c40"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d9e8d219f88ee54b9b58bae54b00b35c4a39ca29539c4aff4f864c3649d7e855"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "5da1971388e0111fca3f5446a6b04afb753fd949eac2319185739714505bb359"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "876ca222b87dbd9e96e8da07c093fc91ed31a6788f8783aa5e4a0f2b9309e036"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62829fc6d2061da47816801d242994b2010cc23eec6917e953b8c01b021b09c0"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "705f8754c4edde014cb0e8a2bdfd228f7314f4b5ee81439584d5b8c56b327fbc"
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
