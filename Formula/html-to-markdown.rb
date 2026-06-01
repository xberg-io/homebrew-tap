# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9ad43ff0a2c50eced6a9c6fa2b21c327406db2f3b463bcb01e07876cf5227dae"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c1664e07b247b144c8e431d674d4dea948bcfc79a4f1d53031efd62b78a00aea"
    sha256 cellar: :any_skip_relocation, sequoia: "5d553f16c022f33c5b6ebcb63123837d12069a6da56b66643aa89c72b94b52d7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "afe8a9d871714ce35aecd5dda37b461014d29ad43f687bb7c93853ff365d4965"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "bbaea4525fab76bd215229683e451cdc3d54394c8d88fdaf2d4d4449526c6c66"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "ea594c4b4c6d73eeae9d2df9ea6fa821438600b59bfe26d5e34ae459474b517a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9d6baecee03db1a03b9ccf95e71e25e8e62266698be7aa19c75a4aa8bc922d4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "845860f637d1fb08baca36f2a9f0300a9d64bf0e84d8b69b8288c0fda1458192"
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
