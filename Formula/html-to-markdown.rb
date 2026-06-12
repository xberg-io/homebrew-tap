# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "77ee0123032fd16ccc5a8cdca8d0ad2ac784be22508cbb5794f55f26d72e76b2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f1af13b2e5c0c1bbe84a0745ab701bd800b1adde2db2e9d44e3be90488c489f1"
    sha256 cellar: :any_skip_relocation, sequoia: "d87d76a3f9bbf839f44e4283ae941044ba90638f74dc2848aeac4d5107597414"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ed2283da190ddf02bbd4e79dc13750df9e05444302609b53de73f8968e499a6"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "0e322453734d0165991c66c7acaaaf9667c865dd63bdcc2b7b87e9fa8a1b12e4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "c34b56e0ac1996470b92cf28d8e33d480f539c15fd27d2f77cd02e4461b655eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "863700a8724d64f235a6786bc8f6aab4fbd2254e49a508dfcaae227c1d567ca8"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3c4518716235cf85f4c00199cb21b715007659440210a1d8264483af945b0d7"
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
