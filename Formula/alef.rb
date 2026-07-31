# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.16.tar.gz"
  sha256 "c818b2df8754cf07c61af908fce756e8fc487ca02b0f6dbb2a842bf8c0ee7ad1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.15"
    sha256 cellar: :any, arm64_linux: "868e5af16915b5ed8aea2804937b98ab5628448f3ee7bf6d7c66408c9af2f885"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c8d863a60a9f97292fa8bc6a047e6e0a447c7bc12c49455cdb62bcea918d1dde"
    sha256 cellar: :any_skip_relocation, sequoia: "c88c5044ce7a056bcd412df7de47cfb1a4e7ae0854491832853462be4b8ed4c6"
    sha256 cellar: :any, x86_64_linux: "f2b23ebab0ab4069aaf8e4f26ee02da5b4f6990a5fe48a0aad645156048fdc57"
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
