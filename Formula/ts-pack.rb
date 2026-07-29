# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.13.7"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.13.7"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2923d2b46021c4c353251fca7436a8d4f41704df9937d0c51f5cc0c58cd84819"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ecb6de2aeaa146057fca346c665d6787dcaa8bbcdd1429c16d72997aa4a81faf"
    sha256 cellar: :any_skip_relocation, sequoia: "1e6744ef7ea4e5a583984474729e0eca72519b43150149e9925115e249863da9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3d2370289813681481b3cf3a30b39e54f33bcb6dc5720f0540890f6cb7912b24"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "051fe7384119b11ad4a49cd8decabe1138880d45d09f5979634eca3d48a96f69"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "0df1f69a838c688b863bc5c27a5a2e23a480cac1a007be4d1d5e2a6c51340436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "ee16e8baceaa1205148adbc6f13f8a17ef1fa8e6e55207b0a5db8b6586e35502"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "2008e613b60c35a46dbcd0058206361c0296565a1fd4244da326d7d31f357c7d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
