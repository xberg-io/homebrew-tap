# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/xberg-io/html-to-markdown"
  version "3.23.5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/html-to-markdown/releases/download/v3.23.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c958120312391e31d7578225c6765efa8357494691732ba2b25c5facd6a3e4cd"
    sha256 cellar: :any, arm64_sequoia: "970530ee5e5744d3b8013e87cc4d5f9454e59e23df01f553139aa9e199e47bdf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4257ee1cf79e8e7c18266389e120b752bcb8bf641c4df3106c97785e4c3a7ad4"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d6139d5ac9c901e1f6e24f0b754b04fcf94a08b13065f09a149285f605221b86"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "098f34c93226544f90d82be1f7ea0f188a9d03105e2b21dbb5ee8039ae16d98e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8baad73e0422f93dd2ff690dfe4beb18c756dc545c0297b5b7c10dfed7c8bb2c"
    end

    on_intel do
      url "https://github.com/xberg-io/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "787d07d56227fe639b73da6158d31c10354de43c0a2cd404276d4447215e348e"
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
