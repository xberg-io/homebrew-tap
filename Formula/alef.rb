# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.56.0.tar.gz"
  sha256 "2cb20fd3af74977da73f022f99a69fe9974fc836d1e30f1c30ba155dce5faa7c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.55.8"
    sha256 cellar: :any, arm64_linux: "6ccb2d333d156389ce40ad0f2d6833098a3dde38bb71a7f1b7857d7d22b91da5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "546dd1baed8dc946a4f57933771d2928d41e6293aa407905805edd70b9ba4d3e"
    sha256 cellar: :any_skip_relocation, sequoia: "352b5602541253a66758d63165a9bb89026cd024e814d69f912866c59f9b8862"
    sha256 cellar: :any, x86_64_linux: "41824fc9e2fb273efac4e333f4f917928739df6fc0f10e8c2e1ca36bcdac9ac8"
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
