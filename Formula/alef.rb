# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.11.tar.gz"
  sha256 "4a3b964225d7eb8e9eb211a67577e514838abeecfccfcc616317beacb8b1b23f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.11"
    sha256 cellar: :any, arm64_linux: "e5aff14f2d05672cb4ff64c68f0e633eaec776a319ff3611d29cbffefab7046b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "32efacf7741eaeb8cba9915bc6b10298fece1297ffdaa9ab9dca07e491247b69"
    sha256 cellar: :any_skip_relocation, sequoia: "5023d44825d8726ba2bd7febad7f1c07b56ac94a54f73248a63a630a3c302a35"
    sha256 cellar: :any, x86_64_linux: "c69314eed76ae3706c35946ca20decdeaa79a577d8e5cf1844bbd5f88a574d51"
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
