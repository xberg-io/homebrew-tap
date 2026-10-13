# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.3.tar.gz"
  sha256 "886141257a1e7cd493ab1a0587a894f0135022f1b424e05654b62a84784db72c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.3"
    sha256 cellar: :any, arm64_linux: "ccedc237a4f6c1d06bf4e8e167070201789a17fe23ca6bb737e963852d54fe05"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "38aa4ea5e5fbad031e11abedb4a6a998bc8723a68d36b84d65ad94c3b102379e"
    sha256 cellar: :any, x86_64_linux: "cec3bd4627ba6de00b12ab315aac0ba2fe51c17806b96db4fd61a5d41ba0cbb2"
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
