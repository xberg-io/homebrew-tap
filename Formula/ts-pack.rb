# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.19"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.19"
    sha256 cellar: :any_skip_relocation, arm64_linux: "90f127c986eae7026681f6bef642d4f8b7067a56b95307f4545834c5871c68d0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9f91b133a2c66f66e4c26d47e85af94b9762437dd55819b14cd89c4c0e510fc1"
    sha256 cellar: :any_skip_relocation, sequoia: "196355ace4c047381c8728f42ddff810722de106a2539e2d4a883f378e28df5a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9390eaf8285f3eacbc57f7a676a4d902e913e27478a59f48c01b4fc807ba4119"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "b19dbaf6118bd4f8f6955989b647ea9faf33d8b601de09bc850a2ca4e681107e"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "cfb80c6a7e79799f88afb7c389cd99f315c330a957b491a8a88d83d173fdacc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "9a2e506fd63b03f299cde8ec0b36380a8187df04b03352c873a9aba0cd8c0bdb"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "f2d6cf4e659f1809e386bb713d002a4c3f3f738db3a3291fe8aeabbb6b39150d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
