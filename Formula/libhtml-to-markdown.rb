# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.13"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.13"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d8764bc6446530e3c74f1c3cda46af6fbe868e1a8320ef2d7cc12df839573227"
    sha256 cellar: :any, arm64_sequoia: "dc682c81590bf61a2d88d4b11a9bbae50ee4529c7ef0a8572858a1d93829e973"
    sha256 cellar: :any, sequoia: "4dde47bb3ad0a35c22f2cec17c408861aff6f6a4f6b7da7c389e7097c5040de0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1d5a5c2be12bd0d15040b5d643dd92d7b079fc48f2178542295bd0c1a49a891"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "21234802e42560314fe2d43ad14571b3c097dcc64a8bd356475bf775e2f109b5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "53a2b8c9069db2211e82cb7929b3243cfc259b65e5f75b1d43658a8ac359ce76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa89a75a03de362ece63db057577c06e4dde2f4cd01a35797d960f0604f17123"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b14b1646a7486b3873b0c00d238352c95182e4af2cd2dc532d5c7fde54e6f954"
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
