# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.17.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "dd5a5ab33e4bb02a36a78e3a2932a7666e567f5762d79103aa45d1581fa545a8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "677be3d672d2041954ba1efa9f5923e714fc690b433bab79c5f3bd7ac1e2e90b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9ee4b6c5ea653efe100b2268e5ea86312ca50fc75a9aaf669328a21c07490e7"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "8060006ef7888fe1f52de6357364603493661ccbb6f328865b467e510ae64811"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "ed6c02071243426cb4dbc277c727ac4842a017a909a2935dadd5562a73313b6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8128fba6ba74d637b6372b1048081911405b9d835200729c390ec8627159e479"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fae9b62f1dc2a89f62f962c800602df48537ad07292083c5f8ede319ad8d82c"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
