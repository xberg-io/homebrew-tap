# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1575f66ce198e4fbdd7b985443ebc7a68c40da50b48e30caf12537a53635c51e"
    sha256 cellar: :any, arm64_tahoe: "28fe5c94003039d0430e37471ce4322597df4593eb180c2125cbf2807cdace9b"
    sha256 cellar: :any, sequoia: "6d9a74887d70c71d673af35580f92bb58b89a730338ef20bdc69f0522c63396f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f46f1a6744c9ebeccbb77ad8384418a86530c9797e2c8ee4969853292e1121f"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "23fda07e4fde3b0b6515334b4c269a586ca91d4e8451bdea9d4f2aec058b43f8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "507c3745c26fcc72bc23e0267dbfd6c918a1c775f81aee9baf6bc4cc8920c3e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bfd80108a3c08f022f8330a9fc183bccfd55e69835d23ad52edac8ae2bbbbd8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d7e97ccaecaa986a21798b726a0b3ecf390ba717e04d8eaf75f7b97c3b6c2ba"
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
