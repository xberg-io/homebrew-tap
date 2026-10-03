# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.10.tar.gz"
  sha256 "cf37cb177b6654b833f095da2495aacfe0d56971ac5740dab1d02a729e929dc8"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.9"
    sha256 cellar: :any, arm64_linux: "0fe45218515e1b6113f1fa3624c497e128b0b895e6f458d67aab0068e7740f15"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c30d48be6f2446c206beec5abd916b9c46243eb9146b93f6c44c3b36ecf55db7"
    sha256 cellar: :any, x86_64_linux: "f33edd07776d5bd878ff5dea04a3c08ba7afbf667fcd18fe859fb442bf81dbd6"
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
