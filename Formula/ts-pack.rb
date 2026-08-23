# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.15.8"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.15.8"
    sha256 cellar: :any_skip_relocation, arm64_linux: "c79ebe6e36968c9122db64ea3c5ec3a4bb1feda6c81a417bf2037d1bf336b959"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "07dde72d47ba4c6add3b0768e92c2017a91f0f6c41db270407f1e01f94554119"
    sha256 cellar: :any_skip_relocation, sequoia: "cbabcd868e25f73966d3c01a04365825ab8881b0e5bfc0aad9bf137c97b6a526"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b847a796a70a23aa355d309c4aa7fb11999b55f296368c1797126068e06115e0"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "cd59e4a8cfb23da0e2491e046ce1bcd9b9c42d9a7ebc48be677663e099570f21"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "dfa68ef0ebef24b5dfdccda2f5cc4aed8fbfcd52df0a859db2e2ca7ae9d65468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b26e34d85d6dcbdaf84c107c190ddc129b0ca9e5ac9b919538226c160151a1f3"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "819d3a3fc8496ddc25c50241ea6263f66ff42e91a7f757c38c16183b49a48e42"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
