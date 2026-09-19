# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.93.1.tar.gz"
  sha256 "a7f5fd0cb05496b55267bf9a06ba129bfe274cc2f14ced76524362f27d289703"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.93.0"
    sha256 cellar: :any, arm64_linux: "fd4372b749606a9a074ba72fb230797be81eefe2cf4952c4e33949882c210e02"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6b516743d9494606cc4f1825320efeb87a65190dfcec6ca6468d046056659b79"
    sha256 cellar: :any, x86_64_linux: "31afee5e065a66f7d908766f92d9d83a44b692b31168e10d46f6c69569644228"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
