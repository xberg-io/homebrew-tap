# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "cee049629745783160fe09da9b260e522809ce8237e350ccb5aabd51fe7163be"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a0c7bc884d458d2291c8222eb39281783bfd71e8c59b92eb7ab2f26e56006b6a"
    sha256 cellar: :any_skip_relocation, sequoia: "bb914a552ee7bfe64f3eee2b34ce9ccadefae812a19de7c0c44f230b93ae60bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a47cf17d89d39163ee76e8e3e4f9eb6cb8c645f343df9f6bf3b2891380794d62"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "0c8aea1dc8779b1e91d51fceb6961b4488ddc08b26bdcf5996b22efe9968817c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "6319828731bb995dcc8136dddb52640aff5a2efdf2a140ca7920870af2e38dfe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0da3f3f1e2d3dcc545b80ca75cd1496a1f3c19c033807f6f06f1513daea920c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "261bda6fdf82d7af4a7118bb432c79b9514f4a8cb08a1adc3cceeca1dc78d05b"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
