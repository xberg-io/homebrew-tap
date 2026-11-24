# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.27.2"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.27.2"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e45183d8db5e1d7dbf1048972921180ff8aa0d5e386b7f815546f63fd30c163e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b89fe946f4ed8acae975abd951aec37075b6eb54c4008198c2e7d6172d9bf190"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e29e42bff0ce69593f746abaaa1121c36c3461e89444020269808054f0dc98d0"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "a13f0210f650e1c993e6234785f1aa13c8cdeda122aca26c13a30f7dea8a5fc0"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "a3c227618d657108cb4996f32ad1687250e1c28be67863dfca0ad7568127e702"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04e45fbf5c2573d1916fff79fb48f46b2eefa8f5b8f6984af0a926e03aa31cb4"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3a6345456b6dad7441f9aa4697a66ccfc6382919817f50b230f3950b4933723"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
