# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.12.tar.gz"
  sha256 "55d5e6fb1983c561a301d32d378513bc2498fdd231514b97aeea4a2fc9f25c70"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.12"
    sha256 cellar: :any, arm64_linux: "4811aecbd31fbfef21984dd29c591b9e3d385da9b4955cdfad88ddbe666025bf"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "76a2ab4c71c8a57de0c92eb4be719d127bbd8aeae485418014734bd8405d3915"
    sha256 cellar: :any_skip_relocation, sequoia: "f5d4956cbd7cf990fb75071e5a8526cb0f230eaba653d6db2cb026815e32cd89"
    sha256 cellar: :any, x86_64_linux: "8f31e088917710341c90bf9288a2a5965fa85fd06a62adf4dde8ec7429ea458f"
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
