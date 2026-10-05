# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.103.18.tar.gz"
  sha256 "27a187d23a3b25653a3b6045c5bd21de83c056a7cb17490a55ce22261368b86e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.103.17"
    sha256 cellar: :any, arm64_linux: "b9160a9b7af079fc784c146ab82f45f5fc2bbc45155d22c731d16a5a26710774"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "73f7a59ab8628fed727184825ba1ea13487eccf6d23708032b8948f8967053f7"
    sha256 cellar: :any, x86_64_linux: "51757951f998c77627244ac2ee1758243d7c4cafadd3a891212ac4ea11e349b8"
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
