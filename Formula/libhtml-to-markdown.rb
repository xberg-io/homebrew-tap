# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.10"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.10"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e8bb20af6b7da3d5f8cd4bbf1fd767d8a534250e6112b30cca6cc736cd42ca06"
    sha256 cellar: :any, arm64_sequoia: "ec01e4da20dadea2bd4caf5bf36f798cf47b6f5edd91d9fa5c08fe265a608005"
    sha256 cellar: :any, sequoia: "53a0272e31e6f6d1d78b39ef7e3d08a321d9883ed3e83ef8e9dd48cf48719321"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b1f36fd560f021cf5122f80680acb44cec843e5c939464484362b0f139adb302"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8e8ff62ebd794ad1f9aafa7a19ca7bf94a0c87d88a35cf59aa226723ffaf64ba"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6168d5115c35e52ec153c1ddc59ed9e65f0959053e36f286046fd6e8dbacc9cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86c4bad4c9e7287a4a8ab74078dc175ec8d3516ffd4653e4e953bac2d427f348"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30175f6bca449329b2bd87f2ed21a36ac2e039a9953ef1debda02e8f98035c8a"
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
