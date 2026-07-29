# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.6"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.6"
    sha256 cellar: :any_skip_relocation, arm64_linux: "66f608781cf63d3833e9c54343814ea6018b827132fd276bc26c648a65cb9bb3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8e8c33b73551768824465446ca03976f70670a663e826caf6e64bf06467275dd"
    sha256 cellar: :any_skip_relocation, sequoia: "b61ba0630910eeb1251724cab623f04cdb48207ef1ef45f465eca83ff9eeb344"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f03a313caafadbd80e453e7427d1358750c3d875d786f3b9905b66ce5c23939a"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "77c706ffad74813b73c2b4325b5a929695a0aa4f63d768a4fc5bf6581fa6271b"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "6577922c93cd2db8b82161029ea604b047d9f30f316a586c08902df707d0579c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6fd005091ac2499da9ba33033a105fcb224b5369010cf644408e62757ecd966d"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "a704087b0d663295d8122aa6e3606fe8a19503941a09db600741d461d63b5e1e"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
