# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.106.1.tar.gz"
  sha256 "618de61206f75ea46d32fada8ee4f98af334ff1b3475097a569b780a19653b72"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.106.1"
    sha256 cellar: :any, arm64_linux: "9e2348f043fd927f417093a5d280eaeac0aaeaac9a0c73b2b2ac5fea859264ad"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1dc65ae28d48bfdc7d95b7420eb5a34c2e06421b87576de50053b64ec67da61f"
    sha256 cellar: :any, x86_64_linux: "db1ce6259532e0a2c8d249c599c25bb54bbeb3e0ad5f15836cb4865f13eb6926"
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
