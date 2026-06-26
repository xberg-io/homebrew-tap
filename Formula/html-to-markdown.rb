# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.8.0-rc.1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.8.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8391347c080538d9a2fd0c2d541145751b92578dc46b04e642c078fea396ce03"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d737d810a7060c7d9d5163f648bc641be1ee1d6edb8dea3071d4c9138140aa78"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "15aadbaa06296627d5f5783b4c76cefe0b4886b5bbbde73cfa86bd6283a79d8e"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "e5f84092b7405df6ac006b19361d8e3b96a48b46bbadbd8b0bf7ea1dcfe994a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1ab5f1b9b4029e3373d8d3730887883945d50c8af8066ae59a28ddcda9275ac"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb466ac48b515308a65883187653911df3559661f5b20b83c0bc2e1ed0367d5a"
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
