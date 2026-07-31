# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "84f23edf35b6413c2d645fa6bef8c92d6091bd6a134c9130d44788f38af80621"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "62ed42e95f1be057ced333da933f3004c9c3603777c7b9bf975c6db4871fa34f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "23a99fb576273e02981ba9152666db14b0ecf2f5fcd239ac115f805a87767487"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "39cf6c62d22e128d624842eecc918de773be6aaf1cb96a8df8d0fff192ef12b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "30ea497751b69e8789a88170a3bdec067cd3f574bb390c22ca186bee413c065e"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b9a4e79066fac3c7ecd2448a3fb7bb81cb9f71bbfdeac0a2a7d771508572a79c"
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
