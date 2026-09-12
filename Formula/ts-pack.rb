# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.19.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.19.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "afdb292ffd3195387f3c7474b48d567a775ede0ddbaba067d71fd3725ac44ebf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9eebc78eff725a2bd0e75dad6d356792dcff347238af898f3f2a739654fb6ad8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "62411a6d0cf1e9c608a53635f65024bb308195f5b546c35786ef3f06a2457bbf"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "5d1ad47f9f1629ac32fcff270ad1db1630bb5f809bc0eeb9dfa0d6c9f25b5734"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "6f5efd57dc2c08867feee5f2cb1c0aed84558b208b1acf3be3f4b47773707d44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b80c87a3ce0b1f6ea11a60c6344afbfbddfbdb7aa13c7ff97abc6702fa42d444"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9fbda32ff557fe93a57d98e1d1cd8e3f494669157e961899f5d7a2bd31e88a7"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
