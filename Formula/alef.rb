# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.17.tar.gz"
  sha256 "de0373f08fa8ed8b67afb68191fa636c7f638d88838d0e94e0f46f787b769973"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.16"
    sha256 cellar: :any, arm64_linux: "4478f93b2182da9e4da747d8d2470f85700802402be6dd46dd5025b23601bc01"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "27d4bdcc5327a8e235cd843064cd7d564f790f17f6dbe9babd2a0962d2c50f25"
    sha256 cellar: :any, x86_64_linux: "ae946684b6d8bc2d52f7c5809e0ddc336d0c631e6ff1ab3d60a2d9a5cac52afa"
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
