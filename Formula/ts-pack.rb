# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "facc97aef01e8a9ba4418533671f20ce96debdfc026366888af73b9bd41774ef"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e8689a04f92db00c89c05b9ec11d49869c5dc3ed31fab5d8b9de53209c261aa0"
    sha256 cellar: :any_skip_relocation, sequoia: "59bf29c1e52b49f910118122a163089193368b4b69568a82aa7075426a1dc1a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a3615c24a9d46f82376d8220a83d0e7d3cec0b506113a39498fdb4b960c9d0b7"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "8731980e1b46dfb21b854fa1ab420b3eb78a817c8821bfe79c5fedc1fbb1c51d"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "a1d6c69c83d9451b98b0d1f9cb91a11e10b6b14c158d26b1c480cc000e43195c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "67b55a39356b0c9bd3fe588d7c8ee62edd62de98c4bde25e35b5e7e2bb5b8e38"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "4d4c1c17996fb8e8e6134b52094481b99f8ede28ada30e1287d62e28dd285090"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
