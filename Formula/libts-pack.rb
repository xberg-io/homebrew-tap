# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2a42b7ef1238df3a591503645ed25bb5170f8cbf5c2acd38518dff5c0c773b30"
    sha256 cellar: :any, arm64_sequoia: "c78f8bcfdc9470a2490d366cd13ed4beecacb56340669780b4a207a1842ab8f3"
    sha256 cellar: :any, sequoia: "92e24f1ca2b9ab5caacdc7a7b82e4e2aa7c86328da7bd410990c0627eb7653cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e9f372f19078f87fe99c5829350c4e9da8b1f18d038f61bcb566e9cad37d8147"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3a2af1ed466c061e005c1cdc03afb59cb61a5d0fac672c22080bcf065e6fde9a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "02b4789131e6e2bb89777471f3a7699766d2f8a7aba9445c80e2a186ce23236a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5df93aee3a4af8a23c87b37da38ed48bd774b2943ff0335f5ea067c7c95cb3a9"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81646680f4fb2fc210cf584d361acbb7d445b1589082b4a7b84f3c2b2267eb3a"
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
