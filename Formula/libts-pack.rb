# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bf0bf8b74b94a86909eec4d8966dcb357e0da23cf0304d89e584834a215ae2a4"
    sha256 cellar: :any, arm64_tahoe: "66a7900a5896af719850d433e6db6d2b0c1c13c313fe1f304a2b0a1d199dd352"
    sha256 cellar: :any, sequoia: "cb2f91fca8de7eef293044e005e0623753967b5fef74707b26242b5eaa1d4224"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1aa4185ce5d0fd64ce7a29f27dd3ff2c58452bb15da4ea4a1b2d49da4e343698"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "34ef0d3518e61c6fbf3dd4725a5747f0ce1b825ce79e8cac5ff4b6c5f229eb2d"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8e805638b979ff85cbef721312823ae29437aea4bddab7b6a4cffa5193d57833"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e1d100fe26ef3a71d5a9bb518b446abd21ddc26ec771ff63b7575592ae42772"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52455caa0e8d0dcef14bab23e88acff3e8019ab124d5c4220104dfec9da7f7b2"
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
