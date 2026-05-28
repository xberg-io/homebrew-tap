# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.4"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ac25700e8257378fd943f71d173c2eca25e0ac975f79eb74c45a61f0220f5247"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "df0141a3bca1deae07ed753ecf8196fb6923ab028c1db49411c0ffd0352fa1b1"
    sha256 cellar: :any_skip_relocation, sequoia: "d92bc152e14c3cae0e28b586b82862988d6a36666f28d3c5396e1a95e13de36b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8175ae87d49892add16cf11a6ee48a54c5c38d5b8c5e458dba54141744695b60"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "b5d80e783ab375700656540b62caed4be6ab91f287f3b9679c1256980dd22f66"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "7ca5e5cdebf243e2ac4030c7a4215055662509ca4c9014991bd2af6418844004"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5cdd92f53588948bff8f80bb14342bdbfd7d52011f534c664a2cd57bf8dee7d9"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad3dda28fa9cde583875584e4d9d4792daa15bac3f22fc77dc8db9ffc430fbd1"
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
