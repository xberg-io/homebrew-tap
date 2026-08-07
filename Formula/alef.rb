# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.55.7.tar.gz"
  sha256 "d35164d4fa93236838c58cef0419daf1c085886336897e1a7d6c57e80b368ce7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.6"
    sha256 cellar: :any, arm64_linux: "8b3c8381a6a620ba7d50dedfb8bdf4104e9feb54c77d23a28ccc8309a52acb63"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e1f0d981b22c24de214ff913a8a73c6dea76ad985bdcf76b7cdeb353dda4958f"
    sha256 cellar: :any_skip_relocation, sequoia: "589ad6d299f5e00aeb013e6a341fda9c10bf926da2a8a07202323acf6c3277c5"
    sha256 cellar: :any, x86_64_linux: "0a8ba58518bcf1745ff7c82c8860feadeef784a616b5b2f9eb8ebdc2ab634a23"
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
