# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ae6a863ed6b2203ee7d81ed7b01429696f3a4431473900dc77b3dad904e97c46"
    sha256 cellar: :any, arm64_tahoe: "dbb5010c1d28f72c1614c3dcb88a5d055725772109b1da736a7e7d2a17e55879"
    sha256 cellar: :any, sequoia: "b2311359375ac395c2e1ad5c0c3aa216625b493abe19ce0209bca484a55b9b9d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53cdf237611746936507cde5f314580f63bd77db8a9a84d2614b616a3e330b85"
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
