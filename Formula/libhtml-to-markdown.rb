# typed: false
# frozen_string_literal: true

class LibhtmlToMarkdown < Formula
  desc "C library for HTML to Markdown conversion (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/html-to-markdown"
  version "3.5.4"
  license "MIT"

  bottle do
    root_url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v3.5.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "8fc39d16c5a6e6cefa19f52aebb10a9ea0476ce1a6e4a2828cb81fe9503f6a3d"
    sha256 cellar: :any, arm64_sequoia: "913cb6df1eb0d01987c5744af051b03ed2bb42f82ff8c94462d5e3337a06b79e"
    sha256 cellar: :any, sequoia: "a1229951462ede0049b348b04347474d546c7de5c20ce367f7c0c117d2d34bd8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "51e26dce82fc711552221f732e9624b65fc3ac0948252f2dc31c626b992f85d5"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f310856c7882522fbe181e820a0a60275a5173686d2e3076f50a857c5e9707d2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "a214e979d119835cfdfceee6901fb912d87d719bf3f9b5104c0a07a4f5dc0cb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28351b5d4619b16089881187579e333f62b8225a7393e637d66c434256356515"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/html-to-markdown/releases/download/v#{version}/html-to-markdown-rs-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05de09f180d11b1f33e19c7442ff39f0491d25bda1236ff7418b8015cdeeecc6"
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
