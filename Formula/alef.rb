# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.85.12.tar.gz"
  sha256 "8a4d23b8e83b46bf0ed0fa48b380f8d1786322d28c646a038f24b0dd43accd90"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.85.11"
    sha256 cellar: :any, arm64_linux: "44342a5853ecc0a0f9a52e435a6c558bf902668151f4680005a3164dd1097d68"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b8e528d9103b5114216dc0f5bb9dc8c88415102ea844904953ceb3ca86b34383"
    sha256 cellar: :any, x86_64_linux: "081f50d37a2aae8ccfb18be49bbcf1ea153c59f74344cbf639962328a5a38b0b"
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
