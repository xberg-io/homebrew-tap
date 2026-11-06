# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.25.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.25.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "ad1a19c0fedb1f7926a3cdc074a1c09defe469d962b45ff947f036b416ea804b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "934179a755eb000581f266b4ca642d000d24ec96b80fd7fe5782d4ebfde7d6ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "69fc7ac9104abfc7eea7d7386ac1d5cde2aee221fc530ccd1c5d579f57015411"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "7b972d1a26d96cdcdcc051ed328a93f081e70f27ee7b3084f0d624620397e9a9"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "eae9ef4bd73f4fb075514744639ab89fc639c91557673af3a389b2db51ece072"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fae241ee1e7ee17e2c80cb84b9545eab0a4869e7d11c2b255375b0da9a31ce55"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c28dd7d37ce6111c889acb797c0131dfb217a98d6b4c7b49d00a2b1916a73936"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
