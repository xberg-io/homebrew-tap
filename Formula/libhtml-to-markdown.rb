# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.21.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.21.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e0ee2e3fb1052aeb19d5264332ac4bfeab612696ac0feeab67574d3aac6e1242"
    sha256 cellar: :any, arm64_tahoe: "23647d8761b6814d328c5393ab90eb898f1b9f31fcb978a77235f37a78a141da"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "70c467d07d368e16d1069ccc77f4fb348709b764cde2934374acc260919bdf57"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "1399fe6aaf1db0b370cdc0f48fa9ed0d01bd76e591d6d93ddb9a778db1d7d431"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4b7e8783f5547ff0447fde09385cc4ce79527d1b1b29aa83375a23090e49b9f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a24d09a61a3f73efba28f1c3d5ed72deb45115d041881b1f00e073caf28f2963"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc3a9547a384fa207b5e43cfd6a48b47f6f76f8756eeeb7d5eb3832795c3ec07"
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
