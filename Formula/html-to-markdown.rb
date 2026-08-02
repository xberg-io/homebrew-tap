# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6ca52d55ad48c5586cabc6c9d195a4f043399368257d427d4e146aca593ec9aa"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "06a29e841275b31b874f25a490ef2b0ec96b7f1983865797e1271de489e9f953"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "92f044a346b324ffa74b8ebc13c6d77446b025bccab23e1a1854273bd5f582f2"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "bdc2d69b358d974127d380df349d064b4e3713480445624f95ef7eafa3185105"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "185790138df4179621614b136d8a6f103e01849d307e9f6457e8e581a0d6f043"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2b1e74a83d7386292d951bda0239476f33a9bc9cf180d65ff970c979a3970b9"
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
