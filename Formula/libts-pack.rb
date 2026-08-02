# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.14.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "51639c62bb117b3df14cffb851acf5c7a4247f8e5a4a2c238f1baf8650b3b797"
    sha256 cellar: :any, arm64_tahoe: "03db01178ad7bf0feb79fc81c6ecb704654c8dceaff4b985c865a27490e49c0d"
    sha256 cellar: :any, sequoia: "3cbd8dced03d2c0efd76de387f3b4fd305f444d8ed43da08389c8ebc4d8d1a21"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fb3f1fec1f81b070c444efd8a9e75e598ad12fa080c913eee7e0ba380b20fe5e"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "70b5e9d5b30f5e26e3a66350e4a225250786721adfc56ecbcf1f2db5192a1f2a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "af906a1dffa680d6b9987a692e3a623dbe4b358b9909df341b43d9b1c32058ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ea25a6858ee88ad7d53f50a2e3da2928274ef117d1ca3f1f4c640bd4e1a5620"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a03f464538cbb641569f8f5f685056d4fac57174649508803b16846a5ce2d6ed"
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
