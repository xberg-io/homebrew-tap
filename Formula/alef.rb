# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.83.1.tar.gz"
  sha256 "e6e487e828eae4a6d6dc77f965de85e4bf7d0cb88b3c004ae6a61a1aaa248d24"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.82.2"
    sha256 cellar: :any, arm64_linux: "f38dcdf65480ecbe9748eeb3e80ebfad0155ad3334467dda0606cffb2cc49667"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1174aacc87262bd5c700f7adb9ed3998024deb93ca2c7f9260e432ce5c2c0c0c"
    sha256 cellar: :any, x86_64_linux: "e7496dd27573b8d15d0dae3cccf35acb75db34f04e4dd4c19adf86e6b82d7e2f"
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
