# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.64.0.tar.gz"
  sha256 "704a69373a8e95107c2354cff8184cd1707f84c1acab240bb7fca7efd2b5c0c3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.63.1"
    sha256 cellar: :any, arm64_linux: "4ac7b9e6b92415b3cc42eb8198693883541098142ff0cf0cb3d03ca02da32354"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "54694e2b5a28d02497d9bf43abb95611f5597295c85f287e926b9b285bb23f46"
    sha256 cellar: :any_skip_relocation, sequoia: "2811cf054a0c7a9d18287fe479363a5285fdfc8775d6a5db5c3296e05db758de"
    sha256 cellar: :any, x86_64_linux: "1cadae41ef32ad516c6935972eaa8752d4514ad98b343204e6f52129b30461d2"
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
