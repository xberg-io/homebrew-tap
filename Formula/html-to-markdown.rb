# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.0-rc.45"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.0-rc.45"
    sha256 cellar: :any_skip_relocation, arm64_linux: "380c3cbdf947736db424edd65e8e86ca93aeab7746085c9b6c5d4e37b55bd450"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7b7f27169940b3860210919fb2bf249d71110e003e4fd645f9ee7595e185a462"
    sha256 cellar: :any_skip_relocation, sequoia: "c75225450d65ae84b27c42545cc8a60c538572fd351744428c8e2f47089ad641"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "671233aa1c4f581d0c9126b2eec41f458699bc546376a6a8aeeae943c2167b6b"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "1aab026555bfe2f4c4c14b0768f159411fac5b37288ceb0b251d643662f78b4b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "14c68cf899795d97251ba15869894df86cac656b870de160f2aed840106f5202"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae0a437b275115769b9546897cd2be03543f799bbc1e9d5dc5505d582947fa39"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "917794d95a41b914cd22a43b4e1c9b3ce7a687874bcf500ba972d97b9580ed40"
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
