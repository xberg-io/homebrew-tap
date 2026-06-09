# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.30"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.30"
    sha256 cellar: :any_skip_relocation, arm64_linux: "82de21567302d19c396326115318d4989a608c17774e12875e22cf90ae79f8b9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f25644c761e82668b6899ee6087c498b591f3a8360535667ae86ba9439a12ed"
    sha256 cellar: :any_skip_relocation, sequoia: "748bdad4e3ebf8cc3c13847e9bef52db2e837c3ec7e7c9f3239bb5206f38d237"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1a473cd281d8f7031728e69ff46ba1b88a3cc9ef13d317ef8c647f5dea109fa3"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "280eb9287b9d78ed7e3eede93dca21ad383e07820741e002849f44573081b044"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "ee305811ad2a8a24a7f004099217be24d5d5f34c10b26774b7b08adea48987ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "27bfb9c7fb85121bfb04cb062dd0f8b4c5a0138cfa5df4c5e034e0fe4e67248d"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "086a101af9516841ff07fdc0ee0e84a13c454cf48d200b152b13cba34987bd72"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
