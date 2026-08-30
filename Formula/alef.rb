# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.79.2.tar.gz"
  sha256 "4b5f20a9a8e7791c88e9cec3757b67a1053b382751f17649e6059417362c4304"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.79.1"
    sha256 cellar: :any, arm64_linux: "8e9311b3b1dc54d5a21c64bb4c523a4bff6305fd9c24458534449b92c4f7b735"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d6fd9bb734160cf2600dfc69346cf02681dd84432e7b29c19b60aac040666ad5"
    sha256 cellar: :any_skip_relocation, sequoia: "9a57eeb2c30828175a6849702f16479138415414025db8329115d323e6331ddb"
    sha256 cellar: :any, x86_64_linux: "98daab654a4512e8afe9fe7f38d2f134998a1cbb4b8a4ff281df661b3a578769"
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
