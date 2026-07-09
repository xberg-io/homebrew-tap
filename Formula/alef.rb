# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.34.3.tar.gz"
  sha256 "75acfcf6a588392dd465bf653219b831906fd008044bdf488dd9e19b98db4e1f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.34.3"
    sha256 cellar: :any, arm64_linux: "c915c36fae773e2322126c6a2de72db41d9c9636df4342680878f9159093c460"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "cfe4c92b161e7482374a9da64eb57d097bbe4ff65241096153cd7f6a20e766c7"
    sha256 cellar: :any_skip_relocation, sequoia: "8fdb51e90ba35ec2a3fb725c147bbd5846042c1ea6de9150035bb1722bb128c3"
    sha256 cellar: :any, x86_64_linux: "5cce96ad9954fa42eac014aa079113e53485f0d045548ac9314500171c4b4d34"
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
