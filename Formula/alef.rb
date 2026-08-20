# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.62.4.tar.gz"
  sha256 "1f279f550646414c7eea6b18a7f7cc5bf35e6843fb538a4d47debe80f1cea62e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.62.3"
    sha256 cellar: :any, arm64_linux: "0068312bef6fdd29cffeaed9f8c477999ee12d9ed21594da8aff79b757c776dd"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "386ab4ccb39b268c279335e894654b433101ca0f314fa398cce80c68d4ff59ee"
    sha256 cellar: :any_skip_relocation, sequoia: "bcfdd79aec882613306d45d58b40e918bcf7ffd611ba1b7fb0a498953043970a"
    sha256 cellar: :any, x86_64_linux: "3f7b7f721af11f5e05ae22d6b6d70b96fcde84665c6fa3fcf4716970f1be6f59"
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
