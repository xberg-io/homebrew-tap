# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.8.3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.8.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "925ca937fac7bbc1ae7e289e131d69a05a3ef75f1f971b11c3eb84bc6208d751"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64e70e5f93dfcc6c03876a0f049eec433d53a7f0bbd2a16e68cfe3183e4df739"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e825959ba20393ef4d54cf2bcd8c00084b40f029b1787bed20073633770be222"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "14cd24fa8ceb07d2bf87b3ae1431a87a60746e3d650e043bf2f4251640b50a2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d3d7191bd17a529ce3dd77f069b612b81a56bfd801f407d48de168990ef34f5"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "642de9b00f8237cc30f8ab10afd25f3dc6b31f76320c0985999576f22ea84940"
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
