# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.22"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.22"
    sha256 cellar: :any_skip_relocation, arm64_linux: "fa6c547467c3053fab10130429a062e2fc44a802dcdb456827c26d0aa7256b42"
    sha256 cellar: :any, arm64_sequoia: "6e09d06f4c7f55f51917c1387c59794caa0509ae4c5e0de69db4e87d4b65a749"
    sha256 cellar: :any, sequoia: "3d8bc6c90451082a0bd9f60cd986c062cd84bc446c1c796aecdb5216d9a3d477"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac4722479caca0b300f76a4454b61ba896548b658b33d981e2d6b07c9af29138"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7dda18090f31096f6ceab6c5e390615d122272aced8837e4081babc8f2cefd69"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2ffcfabe0a10392d60c1903fd0ece68d16bfabc8cf6915eacaec7987e341d5d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fb6be39cfb67cc5379dcf18240a3af92a093ee2107f85715a5f567706cd9e91"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d269faa647ffa60500ad03ece6f2ac8c3b719593aca4da2359b73e011cf6788"
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
