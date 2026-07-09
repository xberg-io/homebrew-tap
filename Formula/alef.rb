# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.4.tar.gz"
  sha256 "2f1444921c0b416d6614ac5dc1367db614bdd5a1073e3b422940bb94ec2a26e5"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.4"
    sha256 cellar: :any, arm64_linux: "f491c4702a5738fbb737166794e4dbd61682c0cb0b3758f068ee4c476f8e526d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2f3659cc3f3877940d75fe3520e82b9120fb161a259e0717a09765111df611fa"
    sha256 cellar: :any_skip_relocation, sequoia: "167b0d76feb0f603e64f67f5cab535328b7e104a194cd19e636fdc036aa76613"
    sha256 cellar: :any, x86_64_linux: "43ace43eb32875364c78ba088d1e8313266bbc2013187f7d21ecfc706fe46483"
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
