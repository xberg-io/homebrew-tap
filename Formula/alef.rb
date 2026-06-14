# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.4.tar.gz"
  sha256 "6ccd587753f5e1b196242f87f5b2da2a442a9b32b0a92bf58689b2bb7b5559ea"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.4"
    sha256 cellar: :any, arm64_linux: "7e02959da60179efeabe013ae540b856bb172e371a23cbcd56c969142b15beeb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a050131cf0cea7e52f6f8722833099c54699edd6eb2308c98270b707f84ab55c"
    sha256 cellar: :any_skip_relocation, sequoia: "05386798336f8fd44188f9b004fbf966ecd035ede32e5d02fedafef548c53660"
    sha256 cellar: :any, x86_64_linux: "cc56724d15794b341f80b46891107c3fba3acb1bf9201303e938b6c6c89e0763"
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
