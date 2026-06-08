# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.23"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.23"
    sha256 cellar: :any_skip_relocation, arm64_linux: "025fbf8124ba845c9b499788dd5112a67728ef4ca0f1bcc85f50018c27ca899c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6b0b8c6983e79fd81782bc02b8f1e0abbf4de44e940a7ef71cbed209fe78a2f2"
    sha256 cellar: :any_skip_relocation, sequoia: "a56b8c7f2971ca91e2a2fd56a030c9811099688e6f0d27188e50708e8e954988"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d00c765e91071e7278cbe4da321a472ff93531ea320a18545e44414e1b1473f1"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b4409690142521fb2b92580c76d4b885b9d6a66df1aa7df7cdac7220db4ff581"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "36d200ad2a64a9b08c4094dbeddf3babfbea5f61202f824f3e7b21321e778d35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d292b39ab44ee370aacf5ef58c9175d64cb71051456a5c28059846a7a4f0e2bb"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f36adca0d402f516c60fe5ab720864408fbbff4e8f1f3bbc690fc406347c669"
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
