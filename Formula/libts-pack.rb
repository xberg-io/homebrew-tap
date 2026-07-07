# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url(
        "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      )
      sha256 "a9a01e4e1e7c3279c81dbcbc54f9f5c1d9195c0ab3656f17a18d7a03d6102136"
    end

    on_intel do
      url(
        "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      )
      sha256 "173904f8092426bd0e45fecfce321cb37548dc1706c9ab67df1b9700e77fa360"
    end
  end

  on_linux do
    on_arm do
      url(
        "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      )
      sha256 "04f80e0dd7d81556bb8b0e4173e6e00a6d92cfaa8ee2a40c55ced99a6e80918d"
    end

    on_intel do
      url(
        "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      )
      sha256 "d1a441143cd7a49fee6a22c8bff3d308950af8237d2bed4dbc71fa98f9eab37d"
    end
  end

  def install
    include.install(Dir["include/*.h"])

    if OS.mac?
      lib.install(Dir["lib/*.dylib"])
    elsif OS.linux?
      lib.install(Dir["lib/*.so"])
    end

    lib.install(Dir["lib/*.a"])

    (lib / "pkgconfig").install("share/pkgconfig/tree-sitter-language-pack.pc")

    inreplace(lib / "pkgconfig/tree-sitter-language-pack.pc", /prefix=.*/, "prefix=#{prefix}")

    (lib / "cmake/tree-sitter-language-pack").install(Dir["lib/cmake/tree-sitter-language-pack/*"])
  end

  test do
    (testpath / "test.c").write(
      <<~C
        #include <ts_pack.h>
        #include <stdio.h>
        int main(void) {
            /* Smoke: verify a known symbol resolves at link time. */
            (void) ts_pack_available_languages;
            printf("ts_pack OK\\n");
            return 0;
        }
      C
    )

    system(
      ENV.cc,
      "test.c",
      "-o",
      "test",
      "-I#{include}",
      "-L#{lib}",
      "-lts_pack_core_ffi"
    )
    assert_match "ts_pack OK", shell_output("./test")
  end
end
