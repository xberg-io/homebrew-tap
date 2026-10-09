# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.107.11.tar.gz"
  sha256 "9c26eca24c95f75bb5576f88e6deaba7977dba9aebdf7367818844557ebd2822"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.107.7"
    sha256 cellar: :any, arm64_linux: "6117935433b51cf5035ca5b1c1ff6a8f001d379ab1e2300d6d995fc8e8cf2c4a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a9eb8dc9d7bfd12a344acabc926f02895418b4315c451374eb8dceafc97a8b90"
    sha256 cellar: :any, x86_64_linux: "57ccc248a158269ce208434a6dd579fa92ade973e8cf8b1f07cdfb4d34ce4da3"
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
