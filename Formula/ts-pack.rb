# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.26"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.26"
    sha256 cellar: :any_skip_relocation, arm64_linux: "726467d70ee6e23e8c2428b879f0885e2d6554fad78f354e2a7918c022373988"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "108d121b7ec40fbbefbbe557b28925d4e831f64f0c3e86b2bdc1c606e9c3174f"
    sha256 cellar: :any_skip_relocation, sequoia: "e766ea7c7bd1307ad255b1a77ca97bd6ead17c60ad8ebac6a7ab69250069f6c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "86b209a36f47f617824b30f80cc3f0761bf93bc4ef547410393dfa7e0bd67646"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "c95e9064e108ddd4de1e1e72f0e9edb6ed6f7a4c5af2be6c71a7b4ddba87e736"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "fb32a45c1949c36b3d8bb5b22d6b4fc9027e1432abae472df38cd48c0c3ef0c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "6e7b613a0de85db5a4a66cad0fdb6a0774e9a40e25e14adf97dbcf112cbd1451"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "8eebb6f0e928f0dee569282558776d77ebbc7051f3536b50e73e73f2df196c22"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
