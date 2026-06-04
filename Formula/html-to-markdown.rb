# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.10"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.10"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8511399683822f91a235d685e06580dcd184c03f8c9d99b5a09380908f559e72"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "db3da4c738042b85972a79d3ed432fd0b49a9ed1000abda5b6edc8ae903b2d5a"
    sha256 cellar: :any_skip_relocation, sequoia: "3895e98a2af6651798709689737b71657caf9dc58e9dca90cbe0a6d0f7b1b182"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6488df90c4a180f96241a9c2cd5420215a32e8264ad87bc5db310af8c1609b38"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "a1b987cdad05962fc4a2e2f8449367c60020011586148131606fecf3b9462ed6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "3f2d6ee2c16b8b8a85005d99e03a774f3cfb78aef64bc95ce5aeb78bc3e153f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b51a2820511525ee87010747923f4604d773b140d1ffb6baef08a02acfeb5352"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8385e30c473f3191c932b7e1b61b740049c02649f3862afe863ea4370dceea6c"
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
