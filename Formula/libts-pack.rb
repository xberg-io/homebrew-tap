# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.50"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.50"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c2fe79f65fb23dca6c4a8eb7ef96176bcb0c7766c87c8bb129a1334a357f33b9"
    sha256 cellar: :any, arm64_sequoia: "55a348b6e5e2e9315ea2229712a36e8f2416e8004d389ef973ba23f7005f97f7"
    sha256 cellar: :any, sequoia: "2de94c48b2575485d8cf34f3d124ae36c6a09a1f3fd24c945344747abbf1496d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8cd58b7c24ac9b70b8d9b09e38aaccf0eb173326230c07e7f30f9baf79091e4d"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8c3f3a83a4fdf9004766a7d80838f4d2aa28f8e16bd21b2d67b1376b2646a1a2"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7daee391ceafda9947ba7fd4c76ced1b2b16f81c50084cd0c22cc56cef7938d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f78bfa83139e12e3b879e55a76ff54887fc2946318c00ce00c49ed1f9c5a5cc"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dd7e5853d075f8292d6b033720f77d545a0bd8393339e0c12da2e7db87d2ab1"
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
