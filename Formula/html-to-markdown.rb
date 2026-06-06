# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.16"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.16"
    sha256 cellar: :any_skip_relocation, arm64_linux: "edaf4b823e331ec965cd0da16ec640c9e69b467169db33875ebed2ef6f86bc48"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "10857efbdd42e1880e9df0b12921c9275b0c2d14b9f492ea10f0c15641930932"
    sha256 cellar: :any_skip_relocation, sequoia: "d064a51da80c284d0e5d47e94cae3e2e1cf426e7aa8edc7eeb510b301622bcc0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "616cfd3068be9f8bced1a684a990b38b50407f3973007dd35d77c27124f952cf"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "49ca19ce37f74137dc9461518fee2af5242256ccaef5a259a2ab1bab05eed5b3"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "dd1bdb2897555993fa6f1b04f5b53d4c9876bbdd91db441b439be60c6f9bf04b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22569b6a4d6d85f38c77641431eb237ae543fcc9d746364809cb4aeb8cc70d7e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e22db97250183bd66c297aa4db1304b2015a283d17feaef12ae5a607d841ed4"
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
