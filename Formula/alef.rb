# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.75.0.tar.gz"
  sha256 "e584d2c9ccc1cc48ff023507e5f7c0a713d23a245d655bf040c8245269fdd29d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.75.0"
    sha256 cellar: :any, arm64_linux: "1cabff6e29d2722d82c789df9658e2f33a5421eefcf4bc0cecb63f6b5989a12d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cb0d7387f3f2f8858f69fcb36a1b48d96dc47ca6817fafb2c16e635f93d08131"
    sha256 cellar: :any_skip_relocation, sequoia: "52f632637df03c918e5894995abad372886b205ee054402ffbce8d9f832dac2c"
    sha256 cellar: :any, x86_64_linux: "bfb28f30ce46842e373796e78a0b875668597dfc273b54f876e6216728b05357"
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
