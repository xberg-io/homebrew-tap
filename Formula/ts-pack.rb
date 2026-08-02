# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 371 parser grammars"
  homepage "https://github.com/xberg-io/tree-sitter-language-pack"
  version "1.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v1.14.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "08827d6f942488f64a6fdb8d171d29f991772ec5af0b4967fbd9d069d8dfefcb"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e272ff8afa31fdf558918c6ddb367c9598ac99ad51ea29a291d02f13f68bdb6c"
    sha256 cellar: :any_skip_relocation, sequoia: "f82de0e486f19b6e6c2d0377d552e42451a5158b2fe301dc3820ac23ba9c1d0a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c22ed65f77259697213ff76dd61bbc4085d035531f4832fe7f81b8197df1a123"
  end

  on_macos do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-apple-darwin.tar.gz"
      sha256 "1136e7ecd6737f5c429157dca19c955f7f0d873e72f6c454005c82580383af85"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-apple-darwin.tar.gz"
      sha256 "fda9bcb9615f277db249b7c6ed0d3b278515592670a6570396c39b8e3f82eba6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "221af904f31242d6b35c06a745b40362b6a40e6e798087bb27443889f62a8043"
    end

    on_intel do
      url "https://github.com/xberg-io/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb71a055d409311814345bdb2957f0af1546370becea45ad3140d899fd80af0d"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
