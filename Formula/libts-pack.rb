# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.10.7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.10.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cdd7536e9f925a45e8a996a158b23d58ece4820212f250ba0ef8d6ff90ff2f88"
    sha256 cellar: :any, arm64_sequoia: "1c25bd05d20607b38224dd44761e45e38bfff262d91c0991e7a31f00251b9595"
    sha256 cellar: :any, sequoia: "43d2c2cf15e56074b516aea624f59b7058be8858f957e7c176706f68f062f359"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9df7c2d6692e824c9dff7f8840be921bf62872d074e8d49f6868bac407a61657"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5cf921d8608cdb864922ce2594871a5b10285e2158a4c971fd93cc4414f32bfb"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "6ad7170cddc5a5305a56b9959ad1b8ebee9e5fc7c3b726a88f16a76d0950b20d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9008efb1e086d5e11af5ac6b38483791c2336cd3fdac4e3a5fdb32123b5a39d2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "918ce6b3bc3d15310c4ec02fefdb933ccfbc0df01855da66dcee637dc25a07fb"
    end
  end

  def install
    include.install Dir["include/*.h"]

    if OS.mac?
      lib.install Dir["lib/*.dylib"]
    elsif OS.linux?
      lib.install Dir["lib/*.so"]
    end
    lib.install Dir["lib/*.a"]

    (lib / "pkgconfig").install "share/pkgconfig/tree-sitter-language-pack.pc"

    inreplace lib / "pkgconfig/tree-sitter-language-pack.pc", /prefix=.*/, "prefix=#{prefix}"

    (lib / "cmake/tree-sitter-language-pack").install Dir["lib/cmake/tree-sitter-language-pack/*"]
  end

  test do
    (testpath / "test.c").write <<~C
      #include <ts_pack.h>
      #include <stdio.h>
      int main(void) {
          /* Smoke: verify a known symbol resolves at link time. */
          (void) ts_pack_available_languages;
          printf("ts_pack OK\\n");
          return 0;
      }
    C

    system ENV.cc, "test.c", "-o", "test",
           "-I#{include}", "-L#{lib}", "-lts_pack_core_ffi"
    assert_match "ts_pack OK", shell_output("./test")
  end
end
