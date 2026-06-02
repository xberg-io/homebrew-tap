# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.2"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "463597a8ce1e4ab51d24a474e2bf1d66a6eecb9cc632c4b0f43e61c07ffb41b5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "90bd5703169e7ca3f3484f45279644f95e84007d757f6f46448ea3482c728561"
    sha256 cellar: :any_skip_relocation, sequoia: "eae77c80acd2ffa9187c289f81fffcc2f79e9e96e2e29ce3e2d50c68523b30f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "04639ba50270e9f69bc190e266f4ca0f7323c038f3ec7c316f4862c8e82ac120"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "a3eaa91c7ea1a9afa1d589bee8ead7ab368de7aa9d380551d413583f839dbf60"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "fee98b7534df983691f374f1338c765b57ea3759f36ff4103446514d5a049e88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "178e1d511b761ba8c5a27ef3cd3edc4cb4879c66de4b692f8861b20dad378034"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc2fe4385b0a6354c4e5547a75f25b58232afa20ba320e87fb6dcfb12f7f69c4"
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
