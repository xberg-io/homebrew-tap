# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2d98dcae794a0e51b4932ac7b1d569b86795daed2f29983f3269fb7e13a9ac52"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2ea1c6091f6c090f7b1fd960f8e9cb7fca7872f1137d19c1dc181fb772e67d1c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5de3e09a2484b00566c310f3ed72f1f34ce94109a96b8e1a7f906305128be242"
  end

  # macOS is Apple Silicon only — the CLI no longer ships an x86_64-apple-darwin
  # build (Intel mac dropped), so there is no on_intel block here.
  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "d0e798711962bd2b3f13fb63bea8d9834d28ca67c36cbe5c8d85b4ab887a2895"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e13a07a4c14731be48f0b7de320c9fb503be35fe982b3a674412472fb59a587d"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "385b1cad028e51a0ab175a7af7cfcbf706224ad66d1edfccc4b73e27d0a6fb4d"
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
