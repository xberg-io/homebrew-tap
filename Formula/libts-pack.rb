# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b12df4cd56878a02e6d84854181c30e8eabf32d4607c85e0be58d23f9dd2919b"
    sha256 cellar: :any, arm64_tahoe: "1b0d63092996c01a1c44812241cf131fbdfa54b8eeae79e4ad2dcb09b136dad9"
    sha256 cellar: :any, sequoia: "c838bdb707a3b30b0011558feb6595e695e5f0cbc8e5cdc12422ac5730849c32"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ac5b29346ee2280d07455f782b9fd1dfb476d1b987b832e25b868f4e8ffcb18"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0317e738c701f5ee37a75b0b93a8b0fa3662b93e8b4af95f6221945bbee3df83"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e0a8d9bf539bc2c3a24aed48082a9f6b7fa7958f59c2e230ee76a24a67d51087"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ba30c446280b27039c60bf57fab81db5252bd95a90ddd5ebe4705a09fca28e7"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c972412610cd30ff422bd54e05be4c98b8553d6a2e3b93c4478fd5c8b4ab6172"
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
