# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.18.tar.gz"
  sha256 "b0145a4096da18a8135f93e320add328c85631515842b640672904887f613a63"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.18"
    sha256 cellar: :any, arm64_linux: "375838e83bf8aa591edbcfa37401f79e333ddc596e215bf5e2f13903fdf019da"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f1e3999b98455e9ff9963e05e6185751e90820861267611ded42b871bf5147d9"
    sha256 cellar: :any, x86_64_linux: "429d52aa192ae141182c9a51008d9fdcae56bb3ff4bdc3c2aba3e2318ec95e3c"
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
