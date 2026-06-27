# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.29.4.tar.gz"
  sha256 "6821e8ac428ed4475b7d50fe0c0436cf3cdcb50693b70ac5fc5ba561c140b8a8"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.29.3"
    sha256 cellar: :any, arm64_linux: "38750d6ea30f67e003d9839afa605be0c4b3557821726d08f3d7316142b00735"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "99683bf88734aa3b4869ede6f38d1fd10abe91d7a177551e9cac4b847ae1cf37"
    sha256 cellar: :any_skip_relocation, sequoia: "78292898f43ee50e03c80beb4b57a22fd22823b11143592fecdf490b2f03116f"
    sha256 cellar: :any, x86_64_linux: "6f0f89a3d0e3728968e6c84fbbd6db14a9a58bad3b4d0448c201d7fa175f8b2e"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
