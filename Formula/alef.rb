# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.2.tar.gz"
  sha256 "a49229f0fb86266cc56518e7f3c397f42bbf95f6dc7c17903ea447e3c9baa428"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.2"
    sha256 cellar: :any, arm64_linux: "4fa5a411df68a5dbaca9c457211ae3111140ae778d667379b8b0668c2c90f8a3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c7b261532eaf9f01a47064c13ccd24cb705896f5ed8e3cc71c2c431b7758e3cb"
    sha256 cellar: :any_skip_relocation, sequoia: "8da4aa309d015e51a4062668d338edcf54b31cd33e8ffd23f50485226a17a2b3"
    sha256 cellar: :any, x86_64_linux: "7cba7c21efea2934eac8777972d187fd5f23e1fc51b77ab5712b0c8fddf00a16"
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
