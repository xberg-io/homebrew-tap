# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/kreuzberg-dev/alef'
  url "https://github.com/kreuzberg-dev/alef/archive/v0.25.40.tar.gz"
  sha256 "5d8ca4164fb48c71e09a743ec62c96c6c9cf082675905f4dfd5fa044f5cee29c"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/alef/releases/download/v0.25.39"
    sha256 cellar: :any, arm64_linux: "54aa8d84692e815a47f7c53a4301178291181e85b9f900f3a9b3dcaa7b220409"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cae53d0e90a078332b552eddc9461a126229ec2ea89c4aa04e17782d6daa9305"
    sha256 cellar: :any_skip_relocation, sequoia: "2f88e185db4ad26ca24cb259f5b1417c8e748b42ca8d21e9f8bf5bc0f4ff8fb7"
    sha256 cellar: :any, x86_64_linux: "1c60fc808345dd13fcaf920fa47666c05f5b59a49106c47ca6234936792006ac"
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
