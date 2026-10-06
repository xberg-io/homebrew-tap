# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.104.3.tar.gz"
  sha256 "25b55501aa70afd66b85a932136ea535966aa3ece58b0907851e064835aac207"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.104.3"
    sha256 cellar: :any, arm64_linux: "2aa5498b4debe6eff34b976e81854ab9dcef48fc75baf0ea28ef8ab04934f912"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3d380e6ca2cdeb20e200d5256d40d9b3de7fb665f53f9dbce0789ba6ca7b5e97"
    sha256 cellar: :any, x86_64_linux: "bc192d4e6cb5f9f815f12a9241bc592e889ffd3e90357f50e48353bd9ae43655"
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
