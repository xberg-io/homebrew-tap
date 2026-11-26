# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.28.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.28.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6296618b683c4b7df8772dfd7992b3504c905d03b7d84a9115e976c4c8ed4d17"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "144d5f4e3681b92a2afc20982364008e980085f2603c39998910d5ea3404b357"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "00f948c29b75ec0c4b60d3bc560cbf54ad2f783958b136fac5eb4a7fb08d2dfe"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "370ed25b7ae136cf3f47a87858f8ac17b03a44e36d3541e70f717f1fd716b8ce"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "b3adbb3f9edfca4145f8334ad9678b9c047b81a21c42344cc9e07fd42391ede7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d641c48802037c354729898aab8c79d2e223e6859086a6c4fbf3d98e7973fd5a"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e2a38263371bdf39bd2272c97e2fabfa6e2bf0072f9ddca050c8e22c85ece2a"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
