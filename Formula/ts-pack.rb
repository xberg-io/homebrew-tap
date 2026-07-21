# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "126426058ce14ed05c798932933f418fa11ae37bc5e24b59202cccc74a844d63"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f00c58b5ecdbefbf3f088a3b3ac62131c03fa7a6c90605a2d3a897ba79e92649"
    sha256 cellar: :any_skip_relocation, sequoia: "a07df8ff7115de4689745a778f1fe075d1903ac149f727b8d7ea4635f4a91cbc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "853c8ed3e2b8ae5cc488bb8ba41e472f4495f43c164e28338fc194b740219b49"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "fe9867bb7aad915049b7ec8c30db6a4b1a9d4a1f5e1377610cf84f0c6eb58c1e"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "7cad7505d11c99a215f0256c917cb97f409db2a815dd03268001f31a023a1eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "3d808b51bed84cb4deb1644210d370b706992425d96ebd50067d6e1321db40c3"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "9dbbecd2e5fdb63ce925ed200beb0273dc87595af1797d5c558b70dd728a9c63"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
