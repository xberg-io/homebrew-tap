# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.4.0-rc.45"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.4.0-rc.45"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bfdfde3db72db8e46d153ef0c80c44df70fa723b089a46904e7fb2a079234893"
    sha256 cellar: :any, arm64_sequoia: "a64e33fb00f0bc3fdd9456732b16844af0a586cd1c4a0062d6ced8e741f86617"
    sha256 cellar: :any, sequoia: "9d8b87fc8909f03873f56f42d1d83815b0c36dc963b24c4b3d448e64087f332d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0fbf212a7a4713bcfe3a6d312d944b5e49bcf8ff27eb38e16d30671f0d9fa54b"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f0aecf2e6229829c90d2645c04e1096b2da5653e0ad82c85a2f7de41d1dd1f43"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a7561604b1e294f9fe1bad1155362f5b20172bb9687101ef5fd3bafe33782171"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "265dc7c6ae38c494326525a53dddbbac96803ff25da3d0e749602f0d7e63226f"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebc04dc892648032bbd4ee05921ff2cf3278949701b3d80b37342a2ecdf7d637"
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
          printf("html-to-markdown %s\n", v);
          return v ? 0 : 1;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lhtml_to_markdown_ffi"
    assert_match version.to_s, shell_output("./test")
  end
end
