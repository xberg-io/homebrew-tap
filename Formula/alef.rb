# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.3.tar.gz"
  sha256 "6774dffa98eb8682758c71b893441508686aec8bdee3ddaa67aa6bc960908ea5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.2"
    sha256 cellar: :any, arm64_linux: "66065169fcb04d2ca66d5cc09759f2e6ddd0bf5e8c7cb209b1da5604947b87af"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "97b2746cd88b1081bacf80bc470129683a1d28007e54baecc023d2efa9fe7c0c"
    sha256 cellar: :any_skip_relocation, sequoia: "397c9be20f2623c8c033ef94592b3d4a0d02a2ebc686ad9743018324c1ca668e"
    sha256 cellar: :any, x86_64_linux: "dc8d6938fc2545e9c482ceb54dd2b7a973387b8135e022f631a5f7d41e45b103"
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
