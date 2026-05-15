# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc 'C library for HTML to Markdown conversion (FFI bindings)'
  homepage 'https://github.com/kreuzberg-dev/html-to-markdown'
  version '3.4.1'
  license 'MIT'

  bottle do
    root_url 'https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.1'
    sha256 cellar: :any_skip_relocation, arm64_linux: 'cf125b21b1c4e8813b921a93b59688929e5de664b7d170fb0d6765067e87d1c7'
    sha256 cellar: :any, arm64_sequoia: '372617412dcad284403e530a2faae62c011c20c7c7e6b005701f96de6b1df160'
    sha256 cellar: :any, sequoia: '9bbf03d47cb821feaa18db728c20561a80b52761f533a1f63f37c10cb5797a86'
    sha256 cellar: :any_skip_relocation, x86_64_linux: 'f8586e6ceb8909aa9566f292b2c1429cc1f9a99d4cee3d90bd9d2cce3e6a5464'
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'c0e544322cff70d76b530e968e32d445795d495c7d7a212c228f0bf746bcc68d'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 '9cea88fb4e61a2f57245277084d200637f12f63baed030898414634285501905'
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 '9fb5d726f3a328b96ac383597e855160ac19bc56ddf2912cc429533fd44ff89b'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 'ed71156aa4caf79e25167bc9a9be35bfd9850479b77903e37038c138b1cdcccf'
    end
  end

  def install
    include.install 'include/html_to_markdown.h'

    if OS.mac?
      lib.install Dir['lib/*.dylib']
    elsif OS.linux?
      lib.install Dir['lib/*.so']
    end
    lib.install Dir['lib/*.a']

    (lib / 'pkgconfig').install 'share/pkgconfig/html-to-markdown-rs.pc'

    inreplace lib / 'pkgconfig/html-to-markdown-rs.pc', /prefix=.*/, "prefix=#{prefix}"

    (lib / 'cmake/html-to-markdown-rs').install Dir['lib/cmake/html-to-markdown-rs/*']
  end

  test do
    (testpath / 'test.c').write <<~C
      #include <html_to_markdown.h>
      #include <stdio.h>
      int main(void) {
          const char *v = html_to_markdown_version();
          printf("html-to-markdown %s\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, 'test.c', '-o', 'test',
           "-I#{include}", "-L#{lib}", '-lhtml_to_markdown_ffi'
    assert_match version.to_s, shell_output('./test')
  end
end
