# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.8"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9adeb8cc6c4fb3d80deb349656e9a0d5f9cd7b2d34b9feaae3cbb332a38cb56d"
    sha256 cellar: :any, arm64_sequoia: "85f381f3f04f35e54a2e92effba47b65fe62b715d2b433ef3a510c6e8820d036"
    sha256 cellar: :any, sequoia: "5a4ffc041682357ad929eff56b7a4c4633b5b0ca2f78ae8d4696ff335fae9184"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d4d1dd536c99b25c73285885c23e60db2ae689aa0a1a5e2185ab92b716bd2393"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "860c774d4eb779c55d3e0a2f0af1f4d2a610fad4f555891221083e568e6c85c0"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "85099dbea7272d3cb056f26a004e929264d40fbacbc421ed8bd867e65335d022"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "654dd344e6a415cbad8eb358170084349ca7a8332a17c657c714b03187ae2fb7"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6838e642f602cddce697e42562a2aa756e5547aa25f3332f3ce8402f31171d7c"
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
