# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc "High-performance HTML to Markdown converter powered by Rust"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.13"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.13"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5d10715f0ad192997a4018769985c6637c6030a64a85139e78f343d997a1247f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6106842a99c02a0bc27809a773271f731baeb2afb21eeb4efc2e11c3e91445a"
    sha256 cellar: :any_skip_relocation, sequoia: "2f92af3407bb11c86c78be244b6049aefb0b07e7b4dc116126af79c7f6017ec7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7651cf3c5769054d785dfa85a05bc6bc953a90fa5930d718e847bd81c2f88800"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 "703ff5c6d2bf6c7b09a78178ae4420361a08cd3bfa43a0eacc04dbb4fb31773f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 "90b3e3be768f99a04f7409070bb6cc626540890327bbf8f44e5737768c82b4a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "900355c8cbd9bed73a3bac1ce9ea9001d714e19475abbb2d4c63e609654e0f08"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b75de1d016b1a0232993ae4faa6056d9c31a7ae34c0c97fa60ff795e601bb33e"
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
