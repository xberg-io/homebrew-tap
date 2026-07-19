# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bdd54f1db78bd437005d0ed0ace7bf119a59f00ed47415b9f8462bc177b993f0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fcde313bed26713a096e75abb98933a1d4079952ca46b6974f2caa36554d4967"
    sha256 cellar: :any_skip_relocation, sequoia: "07f42e705dd9318b626787cd2ce272ed0fa7616427c97ee55bc3f7d04b3d8de1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "319a0889ce3725b596f34dc4a826544d86986802930807997d608f21025a641d"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "cf3bfe08d8730c54966f2cf0a83974be17dcd7c2ae3743016bce558719227421"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "dc1be0b9d0493e95c98f9196d155487fe0e6d59b195c8828156347f8f8771719"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "4b4a8b017f479ec6935b6aecfe39a3b84b59e453509dc7f9a4bb6c6c8a89bff8"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "4c7eb29db287edd1298d74eeba00e824b101efdaeab87a147deef4d7c1ccb8cf"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
