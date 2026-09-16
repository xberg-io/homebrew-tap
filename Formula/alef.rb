# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.2.tar.gz"
  sha256 "78100c0f72550efb7170810f4a5ced917423bd93e835e33732a35c83d8259beb"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.2"
    sha256 cellar: :any, arm64_linux: "6122c1bd89fbae3ae4345ecd6ed2147e5ab8ecf5987e7dece9c730e6b47ef353"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c52884c63de1da566b80826d19d7c9b9dfbba2ce2fad25b6b366c78b2da1c190"
    sha256 cellar: :any, x86_64_linux: "0ea318e6105096f70e0efd99ebc5f58c254f1a0847c9c1dd2b801de001538e7d"
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
