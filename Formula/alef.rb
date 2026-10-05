# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.104.1.tar.gz"
  sha256 "438f1551db49d481f2ca11fc29ae3d3bebb0625439947e3b491cae1cb50b97a1"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.104.0"
    sha256 cellar: :any, arm64_linux: "f76081e992f748f16c2a97c15cfe27505524fa5487a8b55c25f0ad2338dc4a08"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8810581f0cbb7012e632480ab826811a2f1aa598e6b0fbd149d9024b3931b9b7"
    sha256 cellar: :any, x86_64_linux: "0154949b704b4135341e52847b0ee6e46bfa0178086a1e9069ea470bad2372be"
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
