# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.27.3"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.27.3"
    sha256 cellar: :any_skip_relocation, arm64_linux: "87e204c916954649761ddc1407df5039f9507f308f8db9026826498b88801f8d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1fbfc3ca0cd2e8db0d11fcb6bdddbc67fd6d6765ab08cf8e07eddf8ac7bd9c8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "47de0f39aa7644850949347ec57abb524e8cd3169e0541cfff99e8a59c1f0ee9"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "b34dd2195687582bb7f85143da2c9766295321fcc0ddf1832b87f087d861d7a5"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "b449e7da2ed505eff1bad155ed9490e64c31ae54f78e4cbfbbcaf05106dbdcb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fda0624798ee7513225fc154462dd67eee680950dee7e846cfc022188e4b067"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55479969bec9dcdd5693b31abdc9736c7e2ea769497b6a387f8c90cdf5fa8b45"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
