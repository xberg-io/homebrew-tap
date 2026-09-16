# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.2.tar.gz"
  sha256 "78100c0f72550efb7170810f4a5ced917423bd93e835e33732a35c83d8259beb"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.1"
    sha256 cellar: :any, arm64_linux: "47f4a251d669866152a5e11ad38e0f62b62a0cf91c7743174d89634bc41c750b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "38a0c20cd00a9bccfdd7f4ed0ed4e8a465abe9333a36e9bb7a68898389d2241b"
    sha256 cellar: :any, x86_64_linux: "f774030806d18638615e3b1cc9511a2afdfa8ca1d0bbc77575b6c56808972e92"
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
