# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.22.7.tar.gz"
  sha256 "2f8c6904f97a1716249322b4657f36798d543d3c479b7d778afee5d90fffe3ee"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.22.0"
    sha256 cellar: :any_skip_relocation, arm64_linux: "aa4aa0cdc39f33457958ee3bbd2d3f4891a564eda03b3bca16fe29dd5e6e1d5f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bf599076cd072cca2c366db5f86015f6a8e83436094a53309406011274ea2fdd"
    sha256 cellar: :any_skip_relocation, sequoia: "7ccb047120d16657f6e5e10e816bc78887355109f37491a4e7f3f610a9bc0013"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "afc405df1148826f3f0bef6f92a51036e6e5d44a9d764ed5c1003dedd70ce435"
  end

  head 'https://github.com/kreuzberg-dev/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
