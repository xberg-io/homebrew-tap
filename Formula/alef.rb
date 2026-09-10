# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.14.tar.gz"
  sha256 "99b7f20c92bfdc0f40ff0c2fb56f64da67297e0221452642857a4d590ed72db4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.14"
    sha256 cellar: :any, arm64_linux: "d1ac95ed7dcab52cbfc579a963c01bda65e093dc0e7957109f387dba830b60db"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2229601fd05aacfd39bd13f88f849c5108dd98d3a66afadb83e6684613657315"
    sha256 cellar: :any, x86_64_linux: "d8ee80a01b9db47b3136758b20001fa89a8927577503d9536d68599a66f9bf1b"
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
