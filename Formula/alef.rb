# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.65.0.tar.gz"
  sha256 "f55c7bab86bd0534ba1d3e6973a39f7845b488f6f2946c0654bcaebefb415872"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.65.0"
    sha256 cellar: :any, arm64_linux: "d54e06afd8234beb3995515ad9b709ac1e1df1b3758347b6bb740c37a0e3f52d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "11f552bc3acb36046e503800379956a345916ddb78157ec7914f44f340229e52"
    sha256 cellar: :any_skip_relocation, sequoia: "6b7995f7d2f485399f2fe0da8e0611aa1b02f3ea1f70d6ccd5fbcb5317cad842"
    sha256 cellar: :any, x86_64_linux: "06617a5d8233ef6734645472f09809d1bebaed34a45a04fea0e1c1e52c712fbd"
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
