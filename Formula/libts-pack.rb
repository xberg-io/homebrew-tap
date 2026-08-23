# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "84eb2da3b024c597cbcbd587a250ffac57f5ec6f90474e615249eb8a10262073"
    sha256 cellar: :any, arm64_tahoe: "6db8aaaa45edb68516eb07436930fd4a1bc341df742fc1aba9f2003c6846a8ac"
    sha256 cellar: :any, sequoia: "a27893dc3c59f7fef5c4ce0735b7b8f43912308e866ff516301beb8bcecafc2e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1173c5d70262c67daa628fece747d0b1fcb90916dc1aa06d0cb04d3e33d3aad5"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "846b52ca1e507eb3941065bf2e1547fba8d8718c79dd985e3aeded9b09cd31db"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5754339bf6f1599206348cd1dded5996b5f260330ece6b8f398155761de5aea6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9932aa1fc420eb6e3f7623955313e58cdde84da164c89eb20303ecadff81e17c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcb8d23c2053ef81efb608b7cccf98204dfc0148a2de72a6e95ee99652086565"
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
