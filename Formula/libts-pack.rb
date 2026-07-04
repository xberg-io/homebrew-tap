# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc "C library for tree-sitter language pack (FFI bindings)"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "534f1f976ea64f86c598086e5a5f83e8083f92498b4455191491bb5ff2ed8c59"
    sha256 cellar: :any, arm64_sequoia: "a0f0293ed685b21cc68e9c6d6f726e581989ec5965515d4ade2177748602a591"
    sha256 cellar: :any, sequoia: "d7755dfb90b8a4f19e01beda5d853a8af78db261c2d7a5db3cb29dad634daeb3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "915974a5160deed395f150d41a964229eec32a165b55ea7379a9c5346c2d3d5e"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8e237dfed39754db8750a77c8ceb254f0e7448da4a5a305c0a3ef707d40e337f"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "7804cc7c89cb8348405bf5d4788d07b97f4b8ea2e335ff9a0677289cccc7f25b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "11f7a93964a93b2f3d17d6f09897560f51007f94a9ad52888611ab312047ea0c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cffb3cafd1d679f11aeb73c0bf1e6fd97f7946fd33d4007a843d2b13343becb1"
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
