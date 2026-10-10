# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.109.0.tar.gz"
  sha256 "c101fd49058679598549ce8e52223d08ba270d4f6956a85862643ccf7f988f28"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.12"
    sha256 cellar: :any, arm64_linux: "e724dd2c66bece4e18d30edd31528de2e30ec12162ca0c3b1d6b9606c9f06701"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a8d965010b98ccb1a7c81d47b2684d1232d9320556b1812d5cc72ec05552b819"
    sha256 cellar: :any, x86_64_linux: "d744db299fa29b536e816ee3006b114318b3636737286be5ddc36e1d750e57c2"
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
