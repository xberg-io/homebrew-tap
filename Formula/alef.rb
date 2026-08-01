# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.49.0.tar.gz"
  sha256 "a5f69097370cad8189c857f4cf8582fc4a2e55ef7190203e48fc2ed5633b2909"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.49.0"
    sha256 cellar: :any, arm64_linux: "b756a93e5b8da3a728762e590b69ee4b20c30626c5554485ce73a9fa5a516420"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3c24a1d249521f98c6c9927d88aedb5fc6e5e48b2ab3de4fd4026b065d6a609a"
    sha256 cellar: :any_skip_relocation, sequoia: "95b66c6dcd4724064d22f234ee2dae9b0c8669fa2939779604cb71da30f7b5f8"
    sha256 cellar: :any, x86_64_linux: "8fb3e99768a355a87739ee6d623c81f06652e05f4790c1fda497ab0c48287b88"
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
