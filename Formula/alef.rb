# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.110.2.tar.gz"
  sha256 "b9f3537a50d9adc1762bc23f2f1e3f591ac384127878303da6b0b8746b5ec44f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.110.1"
    sha256 cellar: :any, arm64_linux: "bc59598cca994d689cff5911fe09ef5cf7058dbe91924ae9a1a845c36d27ba00"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a4b8dba0d788d3b01b47795c2cb8b648c739ef0a353112a4df12a38e9f05bc64"
    sha256 cellar: :any, x86_64_linux: "ef10c2e5de9b5846d1a5965a669fd6f8ebe2f02fecdc3a65407483bfc47b4225"
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
