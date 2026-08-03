# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.50.0.tar.gz"
  sha256 "18e8783e2c31accf621a77d6c3139e189e57ea005b839e60376fd12adf3bf2bd"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.50.0"
    sha256 cellar: :any, arm64_linux: "9d65fd5ad137e050fffc810cd3f5a33b1ca1f46ebd7826ec870a25b161c56640"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "51749057a5c1af4673a214636421ff395e9873efab849600ab8aaa1c6cdb2251"
    sha256 cellar: :any_skip_relocation, sequoia: "a164df36824823fb61848a5f37e0452a9548281aa12df8e692a0018958b02bb1"
    sha256 cellar: :any, x86_64_linux: "d4cbf9cb13d14c211dd23a9480ed4821b45d91c308ad41e320aee7135fc8d71c"
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
