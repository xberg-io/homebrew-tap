# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.10"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.10"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a664c587bb0dd9f558a72a7981065585ca6bf067652788b5720d2434adf4daa6"
    sha256 cellar: :any, arm64_sequoia: "b63e92deaef8dd7a6dc00341cc64800989a31523b2e96f21bd0a6c10a1523b05"
    sha256 cellar: :any, sequoia: "5cfe57ccef86084f2431e99cc6cd8ad26a2b2a7c40846fcf3ee6630a7276c083"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e2fd1b48c6d4cd7734a78c591d0db9f93b0c345be55442d3d960acdbe1a60137"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3af600c11cf14dd9b5329374750a303763d5328340a3d1caba6a88302b61a72b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4a06d36504363c1b5d4e54e87159eae85365d7b2aef71c04746109aa146790c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3208a94fddf37c43e5c02c0cb347bbc92df8bdc223f740f798f875f5c070ad4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09d2defddd0d33a3ff616c49a8556719671b85c20efc3780d48d84d17aeb14ab"
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
