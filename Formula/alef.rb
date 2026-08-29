# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.79.0.tar.gz"
  sha256 "1853342d78076509360ddb45e5d2ce472464d9115b5d98323f78fc152f5de055"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.79.0"
    sha256 cellar: :any, arm64_linux: "9206caa1c82a79e57bd49b4a7f689491c32512965915e4d6499c10a1dae7deb7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "153efcd1f60c5d54dccdf50072cb645eb6904eb659c96b149b7932d17e462f8b"
    sha256 cellar: :any_skip_relocation, sequoia: "6dc23aad98c8f1a70a45e7e7f34fcc2cc0a2c7a3cd62d34ba2f4cde69554d0cf"
    sha256 cellar: :any, x86_64_linux: "45ae3ca5085f8efb890b3bb8f2a6aaf53c107379588499354865a5219a7ea754"
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
