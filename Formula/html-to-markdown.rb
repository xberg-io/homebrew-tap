# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.8.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.8.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "64819894345dd30f509839e36d6e1dbf7056ea61a21e2c764d91df72cb513095"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a633129877d5a8998b1f3e79971d761900c84e2db15df1d214079c985bd936c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ea29540b63ac6bad398e3667a7b2689ae355fecbb976b8eb83f34d62a3379450"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "dd0fdba610cfb8cf77b5afcf70bbca88316523e66cb19a8a49b509652ce3a1c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10e6474cd1c729ebb1a6270fab57be22357d66c0de859ec36a0569cdeadc2d8d"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "863ca234cb15073e226289638a1203a4730016f41b721c4bfab7f659959299c3"
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
