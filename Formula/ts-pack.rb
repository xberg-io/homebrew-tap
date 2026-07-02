# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "efbf2fb2a1da322216386625997fa3dcbd5e9ed425930407cbc791ccdeb895c9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "81537330bfd621b9dcd38462503df7143abba1b137693485d3f1852abf8e7a4e"
    sha256 cellar: :any_skip_relocation, sequoia: "67dc0fe0f68f6a5c916720c2abff3486082790a130cd1931d8dd65c78ef08dd9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac2f668992c088514677c6ed1a032e692362535b7d7151c1338dabb0baead860"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "c928dc112fa872479811b7f331df7347fedb1943016747fc11f811e190922903"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "fe29124d0ae49030c57e831e1038e323dda91c782ee47a319d616bdec2ed82bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "24a75aded6c5f169b73486bfa859d539e4a9cc2a10d67f9fa1cbb460b21c4a61"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "fc17cb24bb9011818d3e3ee26b5272c8703228fd04a288d68859be7611d74265"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
