# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.12.4"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.12.4"
    sha256 cellar: :any_skip_relocation, arm64_linux: "2c363eafd4fdd5c6fb297f0df431b2e53b5ff7c3cb09cf1b87979f2772309894"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "253813708240f3610aa3d26292d9f3ca68e8815688a7fd8af0368c3c8666577c"
    sha256 cellar: :any_skip_relocation, sequoia: "7452264701104cec393c48e14ebd5a82a5c9e41bef28b5ae106f5b2f7fadc2a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "49bb42bb767a284915d4265416b07c519615c73181b713655e0d55be9b989db5"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "4db5ef7ebcf2d13b80371a7c190d835ceccae885584cf3a7e9fbd1015c3c45e6"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "021d298d347598ea72d6baec4262a5f085165fb24043d2e55f51fae0a680060d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "39ba1924c42352428d58db4f9ac24a5c0ab0e0cd04652e994fba0b365bff4b2c"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "9f36d7c9b57e82fc86c20cf9cacf244a6f59192515b9e2447025a55c284c957d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
