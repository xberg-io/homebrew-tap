# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.101.0.tar.gz"
  sha256 "b52ef6df01ec4295c07c74cfb4ea895c47fb264d5a2fe386baa17a4a22b5a718"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.101.0"
    sha256 cellar: :any, arm64_linux: "24e11052dce44b92058592cc8878f904a89189c5a490584622f0ce38f15b34c1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "db9bd77f00544d8b4744430c402055dd172e47a402707cc11d5c4fa5959aac03"
    sha256 cellar: :any, x86_64_linux: "4bc25444be6843b298e96beaab638e47f5a6b71de486a3fd50d1ed65b35c443d"
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
