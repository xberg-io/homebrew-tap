# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.5.tar.gz"
  sha256 "24200a0865ad08b0f739885725768646b8f41dcab5421fd55e33046f6a203648"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.5"
    sha256 cellar: :any, arm64_linux: "07455f03f6f7328707b6cd94048670109756be5ceb491c7f4f2bf1e8a7f55310"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bf6f05297842fc329ad6def1849aa4744ac8852671010f97cf19e366c61a668d"
    sha256 cellar: :any, x86_64_linux: "0d3dd4ef3d658f6d74be3ce80c31851360e26525a12aeb3173a42ab8dfbc6076"
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
