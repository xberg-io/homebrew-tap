# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "a003cd925ea2e59399bb6f8d69bc79d5d571961eb2edb8bbe7f73f361e02f68a"
    sha256 cellar: :any, arm64_tahoe: "01f00e50baa5b4505c6a97b297194682acf92ca7ae92e98a836b1f4206f7b459"
    sha256 cellar: :any, sequoia: "7c13ae3c8f6e1c0d974d2900d21b8f4bd2eae1c40ec8c455c3a38136ccced854"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "66c6933e7d1ce69fdc4249ea650a78ce5c1c1c2916af9937b4cb6dd0c586ddc4"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bdeaeaf27351b7f90dfe86f6497fca94ca7c11243d50bb5b812fbda87cf8cbb7"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "2dd2b5b9ece9408f0fac3a87427c3e66aac0c082c92d808cf14b32d0b7848318"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "785dc22c97887dd7c143f20e0055216662bc591887c3953c0f4354e1b4ea0505"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bd7c88dd9ad905645ef25babcece63547dc6a5b37460936e41260311fe4e8ed"
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
