# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.10.5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.10.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "41ea5459c8e655b44db8ffd8302be8bc2b0f0ec0121d135be5208b3990ce7484"
    sha256 cellar: :any, arm64_tahoe: "0d3d7dba582aa9f21cc018d662b66c8244395c5cb537df3af2e649b827ff77c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cd81babdc29ba9e89a0816ac65c77d2841cd98cfbc9d9d21053f171bd3b371ab"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "2f352fbbf5ae990ed56d265e75ae913a9cb45821cb91a97b84612692dfdf2c38"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8dc44e68cc5b3c6b365b28aca3f3fb91f67634e0bb245b10045d97cfc68ac36a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aaaa82568972e5532f348ef235e7d6d8d558ef2526262002f0f13af8a9847813"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fdc3d36daec5de3f7fc21d1d6536908bf4a007ddc4e9aeceb0e697bd5e7ed1d"
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
