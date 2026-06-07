# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.6.0-rc.21"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.6.0-rc.21"
    sha256 cellar: :any_skip_relocation, arm64_linux: "082adcfc5f579a073fae7298e885dfc41bfaf22a3972c7af3b52ae2c86ceb50d"
    sha256 cellar: :any, arm64_sequoia: "45667893750587f3833acf69c5ba3d3fc6634906cf7f6773463a54800de5c935"
    sha256 cellar: :any, sequoia: "8c3f52eda3e25362cafdeb9650d6688b66486f4e6efc55da84546bb4647839e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9c889d14364ba434a0ef90ece42373e5a0de230a91542e58b2c769e9f0cd914"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d529d6453b2e90a09770f280453352224520282fe33833f3dab35b830691dbc5"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fd4013f6d1e8557b22fc14387218e58f559efa7ae50f9902b333e56ca64c7980"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56980be9b8c23ca6e889059e5e4d05a70fc0ad8aeed487547625bdf82df2979c"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0066b654ae6b697ed28bf5af0a7fa3f6604113c77de651bdbe5752114aed9efb"
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
