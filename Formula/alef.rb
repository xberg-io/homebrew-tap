# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.23.42.tar.gz"
  sha256 "061823722d78f037478fdccc98483d0de9b979a7f31ed200041264d09d096ed0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.23.42"
    sha256 cellar: :any, arm64_linux: "9adb1ce249fff9fc3676f7ee9d9d75afcdb296d8600e383594b38908e7e7f5c1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5d33a9b126757bb30eba0ea6804b1dfccc1a4f34c5a44b3b76b675cb17119b4"
    sha256 cellar: :any_skip_relocation, sequoia: "2c89863fd6886129ca892ad4d53863ea5702b4783f53c4abba5899ee58260930"
    sha256 cellar: :any, x86_64_linux: "f84461a54ad3502c39681a83cbeeece19226d4697143443ae10598b43001aa48"
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
