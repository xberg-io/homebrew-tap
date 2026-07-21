# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.40.0.tar.gz"
  sha256 "b634ebfc8f968fc4fd99e6e384cb3a7adcf66b1a113d1479ca0cced8a4523c29"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.38.4"
    sha256 cellar: :any, arm64_linux: "299a53d8206788297b1dd35018fd2fe5bbeb2b138c91190452735c5564e1ce55"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3b2c0a02c3576e4db5462edaf43ffb7406a2953ebf9f391dd694eeb5b7f37762"
    sha256 cellar: :any_skip_relocation, sequoia: "2084512167b3b36320f527e67d836f0097811c0c1abe28f02ad3c894d57f4b7a"
    sha256 cellar: :any, x86_64_linux: "5e28b3361e265209bc1ab9a120fa8faccf81120d4a0d9fbe9440ae1e6c3db141"
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
