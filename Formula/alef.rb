# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.4.tar.gz"
  sha256 "265e0678bae1b9b72a48ec76763e16bdd36cef9d308a9db4f78d64c7e5b5cf9d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.4"
    sha256 cellar: :any, arm64_linux: "e0cbe6d7499dcf7dd351e6a1635e83e3e71acb0e91c18aead151f90304ca203b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3e84b6553e459f3c166f7bcb95f22f4b3294206159f5fbca826a284cd5580791"
    sha256 cellar: :any_skip_relocation, sequoia: "17391d6a4b5015094bab9a4189de121361acb780c6308376711dec30c0288741"
    sha256 cellar: :any, x86_64_linux: "b845b44af2716574e25815e8a944d7f41bcd0e42e178c4dff6eaaaf0f192f9da"
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
