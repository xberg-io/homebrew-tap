# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.21"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.21"
    sha256 cellar: :any_skip_relocation, arm64_linux: "f69aa84791557e09d5a8d9f3fcef7730eef400e51c752ddfdd8a9cb1d53693dc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8edc0c880bfa3f6b797866a1aa8f62465d4858b95d16f3028753562dc48cba93"
    sha256 cellar: :any_skip_relocation, sequoia: "47a653c3ea27d8bd584c3529c1ef710a8bf4c60d1c70c16e51388685a3e07e99"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9ffafaea013028ba018b23eb128ae7fc1973e0018998a09b7029830c9059ea2"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "3388c12779e5a2ff010c354c56fb0dea80bc816a85458ff2b80c9f38bfcdd1ac"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "f48398dbe4f771360fa1ad5ca2493e633aa63fba52436ce1141de584ada4c0c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb7cc5db02665295c844ccdf388c2f26a48e45ee3fc7ea5e34f166266dce249d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af12a8f7274dd30d15ee054449327fdda2869656a00390626ebaa791f7a8bf55"
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
