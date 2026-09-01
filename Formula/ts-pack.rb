# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.16.1"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.16.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "6df39bd36c6d72dcf2b36dd6e7d3c586ca99e38eb257ffc925d7ee3b232dd6a0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "372854d5f2eed8dfdb97382205681a1cac1adfc7adc12f131c1265c4e48e48f8"
    sha256 cellar: :any_skip_relocation, sequoia: "f1122b417c0dac154d247a9528ce094a176a5a93acabedfa09be0655a692b9d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d0470d047e5aafad6c579c00c0b4271d88959ace1ca95dc59720392287e364ee"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "2b55408b67d1d67d36ab4b61146d768273990855bae66baa9fbaab31606e7e5b"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "fe4697faa99508c2cbd8c245b0bc48be2c7e42b6b54ca5549e69777ff50d7a49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a761dd885081eb90e5f8f71391c637af84cb6ed12dd366b937baef046d23842"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93633b2bf98b68d1ec6da9df0fac5e1fd2c003bd7d8e4c7b39afd6584715bc0a"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
