# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "85feb2a2f6db5431b8398483901e4489438690d12a187d7398d4b0f623dc71ad"
    sha256 cellar: :any, arm64_sequoia: "4f0e1b28b7b4a4062db5472ef8d3bd5b652aa5b6736793f823227369a18330aa"
    sha256 cellar: :any, sequoia: "b82d6ec8d92e775b2253eddae5ce825d874620b20043b23a98b8d98138197a35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce4e56c512de41a183d6e0971ea8eff73b381152045c387c25c6e814d321f5d6"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "e58357502492e857c8d2fcadd9b9194ff79a880eb4c8f5fadcb1e0f6ffe5f263"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2d845d387ece462887033cc4b03f0cb06ad501570528a9e13d656084be214847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b9c7ecaacc85fee35b180ca44f729ef3b5514bb3a36a2f4a57f4422afd3d22a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90921b585fbb16f62fc1a0d74624bdc0f6a7b5fdbf4292d1bd398ee75f804cfc"
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
