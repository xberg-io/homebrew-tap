# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 305 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.1"
  url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v#{version}.tar.gz"
  sha256 "c498258e7fd765fe18e87d598b4da12babc6245bd46b1a2217959b3010581919"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e6f6de70b7c789a9362f993b1009ad1533aa4a9ef4d5359368f9d2bc4fe846e3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "07cb0e140fa0ebb8419beba9d9c33584b6375d64ccefd670eec14695ddfcab69"
    sha256 cellar: :any_skip_relocation, sequoia: "542ce697ffbee9883a9ac10ea042eee99a7017c45926613c68f89b4df87a980d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff23b6c65dd2b5daacd9977381a02913c26d6d905ca8e892395315435662dbf5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/ts-pack-cli")
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
