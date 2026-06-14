# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.45"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.45"
    sha256 cellar: :any_skip_relocation, arm64_linux: "b3087b649ff317d51a2d5e807a5e154f0f5d6a4ddb8ace3acf90c3463c2cc97c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "637dc6cfc903f1910901a024eb0aad4ee58bbdb5bb11e007a483b8af05604b6c"
    sha256 cellar: :any_skip_relocation, sequoia: "e61365fdc9c764df9064acbeffa710725029521d4046d85887825f55ac119bfd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "85467125c1fd83b13ce7cf579c0c24e144c54a89c065e1b9e0311006f8a92b8f"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "10adb3eb2416be8dffb22aa318229e67ab6c24d540931d3b70fa7e79bf2cf56a"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "2f4c0c3de01083d2fb30959a211654cd15d3c9d65890666b5b974a8839b778a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "3af34239403d7f0560dd03afd71cdf4930e0f9b41e0a57be494c08eb00a127ab"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "8c316506e50222bdc769c88e5745a209002c8f929e96b192b8c70207ce5bc057"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
