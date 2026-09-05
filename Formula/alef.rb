# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.83.3.tar.gz"
  sha256 "f49b33dbd59423668c8132d8f4b27d56c632840236ae060c8da745a683b15a43"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.83.2"
    sha256 cellar: :any, arm64_linux: "3d4e36b65738434c00e33cc267e93bda5271d8369f15d9a030ddb83d5c4a1951"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "585bb07a70281fc81a16e75da990247da0ff224a7370b6d51030608aa3281e74"
    sha256 cellar: :any, x86_64_linux: "89cdbcba7ecfab2cdafda611e295a16666194f38a7caeec7befac66e70b2ce89"
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
