# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.58.0.tar.gz"
  sha256 "253644398419a7a30c7942dce0c371ac593881c634daec10e83fcfef6f25a351"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.58.0"
    sha256 cellar: :any, arm64_linux: "c1344af16149007675916679d8f8f5ef00719422d5a4ab5e564c67a65210c324"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "864171333694180e49f5d8edc04fccb8c50f7db07b28777f9b6f25098aa1c9b8"
    sha256 cellar: :any_skip_relocation, sequoia: "9899019b60030c384683655fddb185a82c1e4ee70489b469150415978da3c628"
    sha256 cellar: :any, x86_64_linux: "049eccf6749fa12fcb5a39ad6b53b797ef24ae28ac4c1b00d8888afba6f78ee9"
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
