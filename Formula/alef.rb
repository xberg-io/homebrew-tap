# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.7.tar.gz"
  sha256 "4ad67ca56d1e1db0a71151dd39d33021a7704caebe4278c39ccc3907860fa584"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.6"
    sha256 cellar: :any, arm64_linux: "b408bdffb5196997a1ffaa250099ddc612616efc1be9a9a755df5f147d95f1f9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ed466e35c2de4ea0c9e40bed9729d7a09ae359194c0c3af6cd21be47ce76e538"
    sha256 cellar: :any, x86_64_linux: "dfee87e910b6ca61784966231591c09f8df69d92a3e85e4fad68222af516b2db"
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
