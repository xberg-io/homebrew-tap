# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.10.6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.10.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e59db95596ac46d69804caec1bd73ac34ff60db50e7446c9ac9a4bd4d8fd02fa"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d826f133fa8839e66aa16ba3710dc9aceeff928ad6f11823e10349f72e519c3"
    sha256 cellar: :any_skip_relocation, sequoia: "2c3918450958d8e0d111e57cb7669627fddaba76e6a7ea9c043f90cbf19ff096"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b365c2b4c010f1404556459c49cfc4ece6e07af55cdaddb28f0cb2e582aa9318"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "ef919c00abc63c99c80d6d70ba43991ab101fe160d17b83f865ecc169898c446"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "d357b3a68110fbdca05354437a6b49a776c5267bb9c655d9f5e9a82452df5e83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "7d9b092f4967b9f55a25b247061c3d61444af8d4eceffa6a34ab22f238761fbe"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "bddbc7b4df65e2c2eeb04ecfacb10d9df0ad336ef87c99ca523535fe0e571a6a"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
