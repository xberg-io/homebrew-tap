# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.20.0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.20.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "98812cb5949f4cabb1afbb58db8c00e3ce8754b7453a0eb931aa4ed3a2c20b4f"
    sha256 cellar: :any, arm64_tahoe: "7501496e9310d9ed4b4e2bf430573e4e442db2639ac2c88e29337c7cc26cede1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aaef2e4fc96b26cd3d0080b3362f60a64702424970b338b02b8926ab823e0488"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "6250cf10841552ec99005a7fc757dfd87e81515a73813f5a80aade5a06c7c8ca"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ae384f7e36a641ca1ce2b8e4ff4dcab00e92862b54151c7001828b80847e8c86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1abacf94e7b7ce181704b04f906b4dcd2a8249e70e84c86241b4971b95b32901"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9f4e754eb10028408395c84c93f650e3922c4d0e469f1e4165e29430f6ad438"
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
