# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.13"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.13"
    sha256 cellar: :any_skip_relocation, arm64_linux: "4a3a54bb0447b3b247cfdbe810f53fcbed1600ad85faf35e76073e1759d16922"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2e26d76a7b26582bc0f2a4589861e0b59a23eb0ab49a01436357c80404ad681a"
    sha256 cellar: :any_skip_relocation, sequoia: "bcdc812d5c481f45e9793193dcadbb57a9b071e9264bbb52119ce90eec3f981c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1365d2f02888b99036004813a57a0c1ebeb0d937ff0d558dd68b8c6ccaf9ebe6"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b1aafe57bb8ed4bab5a504321251d6a4cea185cf5428a330b767d60b2936e7d1"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "7551ac0b1a13dc6ec19fa87bee8f11ff8c80ec99b69233540bb2df06eca567eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96c84497fb098f330bd44df1a2893984348558cf66e081c6f8048d0aa61cd137"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5b2006bb62209d1ec639ce6c0cf715214852e4b6cc8f7edbd13a6eee6b0c94b"
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
