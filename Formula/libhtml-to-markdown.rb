# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7014e4bc1eb13aacce1e882e2e4e65b01ee067f16b37d70499da49824f197f84"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9c16118248b04b6caf40abcb7fedee33640e605a0ee186646fd4b6c8b1248ad0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2443261fecd4d30a579bb034022e033d1c1d91a921defcb0a0c30fedef42598"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb6496ac3772e9ad7b0a46f075932645f31080949c4e35e3e0a6d6e40cbb24bd"
    end
  end

  def install
    include.install "include/html_to_markdown.h"

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/html-to-markdown-rs.pc"

    inreplace lib / "pkgconfig/html-to-markdown-rs.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/html-to-markdown-rs").install Dir["lib/cmake/html-to-markdown-rs/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <html_to_markdown.h>
      #include <stdio.h>
      int main(void) {
          const char *v = html_to_markdown_version();
          printf("html-to-markdown %s\\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lhtml_to_markdown_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
