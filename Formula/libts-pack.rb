# typed: false
# frozen_string_literal: true

class LibtsPack < Formula
  desc 'C library for tree-sitter language pack (FFI bindings)'
  homepage 'https://github.com/kreuzberg-dev/tree-sitter-language-pack'
  version '1.8.0-rc.37'
  license any_of: ['MIT', 'Apache-2.0']

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 'PLACEHOLDER_SHA_DARWIN_ARM'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 'PLACEHOLDER_SHA_DARWIN_INTEL'
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 'PLACEHOLDER_SHA_LINUX_ARM'
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/tree-sitter-language-pack-ffi-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 'PLACEHOLDER_SHA_LINUX_INTEL'
    end
  end

  def install
    include.install Dir['include/*.h']

    if OS.mac?
      lib.install Dir['lib/*.dylib']
    elsif OS.linux?
      lib.install Dir['lib/*.so']
    end
    lib.install Dir['lib/*.a']

    (lib / 'pkgconfig').install 'share/pkgconfig/tree-sitter-language-pack.pc'

    inreplace lib / 'pkgconfig/tree-sitter-language-pack.pc', /prefix=.*/, "prefix=#{prefix}"

    (lib / 'cmake/tree-sitter-language-pack').install Dir['lib/cmake/tree-sitter-language-pack/*']
  end

  test do
    (testpath / 'test.c').write <<~C
      #include <ts_pack.h>
      #include <stdio.h>
      int main(void) {
          /* ts_pack_available_languages returns a heap-allocated string array;
             call and immediately free for a smoke test. */
          const char *const *langs = ts_pack_available_languages(NULL);
          if (langs == NULL) return 1;
          /* Just verify the symbol resolves and returns non-null. */
          printf("ts_pack OK\\n");
          return 0;
      }
    C

    system ENV.cc, 'test.c', '-o', 'test',
           "-I#{include}", "-L#{lib}", '-lts_pack_core_ffi'
    assert_match 'ts_pack OK', shell_output('./test')
  end
end
