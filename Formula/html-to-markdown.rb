# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.6"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "17a70065484f93a7d2e7e5ec8cb97a675ab8e31edbbce1851089a0228400d61c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fda143437c39fa26d2c0da7982416b5a27fc8eeadb4912b8b7284b13ad132dfc"
    sha256 cellar: :any_skip_relocation, sequoia: "4b7a81182a0d4f30614035c76185a41d0eb250d0d0af82ec94b48b3292992114"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4d9bb802cfe6ebb3cdae237b8171026ad8e08697c1da22d3c79860f85dbcf4e0"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "f1157a558f2c4ef1a75908839a635b44957fef512fc330ae396ebf5f3017faf6"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "e98c394a339f42adfd6bbd9b4b304fd41a2f0866d4a3b94e19c4092467649705"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "426ed008c057179efda95b56a5bd9ac4c32e985c77829386281724bf3440d360"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79a999627090133d8c3f388b158ca35c2a202c4394d2b97195f9e461a481e936"
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
