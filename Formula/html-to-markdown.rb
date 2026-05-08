# typed: false
# frozen_string_literal: true

class HtmlToMarkdown < Formula
  desc 'High-performance HTML to Markdown converter powered by Rust'
  homepage 'https://github.com/kreuzberg-dev/html-to-markdown'
  version '3.4.0-rc.41'
  license 'MIT'

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-apple-darwin.tar.gz"
      sha256 '3bef71cc3ee359c693ab31800f218fb398eb17a346af084725f2fc7ddf54a2b8'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-apple-darwin.tar.gz"
      sha256 'a197e3ba45a3145a6cae70dfe95d9cf73067a7a74ba6bcc55473465fc907b71c'
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 '9f72aa38720a969cd798dc56ac61d11ca4af84d2857ea72855daec5817d8a540'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 '6e5d86c54cdafc6bde87cfb1c4b8831f0803297af015a9bcc566cc78c023002a'
    end
  end

  def install
    bin.install 'html-to-markdown'
  end

  test do
    (testpath / 'test.html').write <<~EOS
      <h1>Hello World</h1>
      <p>This is <strong>bold</strong> text.</p>
    EOS

    output = shell_output("#{bin}/html-to-markdown test.html")
    assert_match 'Hello World', output
    assert_match '**bold**', output
  end
end
