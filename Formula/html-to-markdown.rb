# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.0-rc.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5e1211de925549bc64e5bcd24acc08f90bfe8be43bf5f225d449ed222c465860"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8e676973e23b239f1370a7b9574ec8d191c64fa45ec7d356b9951f5937588cfd"
    sha256 cellar: :any_skip_relocation, sequoia: "f455dd6afbfef3df04cef420ad69f82d8075dac34b1165541679850e094723df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ab3d574ba6fb926b73a2bf0b028f1039a90ed48ae938ea0770b632a53bc94d22"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "bbccfc51ecda2f5d8bd6b6d08030e6140dbd05fe085b9ed44f277a5923ca7fbc"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "388a60da8abd8ba8f92b544a79d976d2123062ccb50a21cb2e930f3fb41560a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad3fd50e7d720aae246f3560623b549683345a709d82f77dea429a733f676c4b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0f28e6c05bd203005033f3d19de0d5e8bb5a0b4916193fc5cf33101490bc8fd8"
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
