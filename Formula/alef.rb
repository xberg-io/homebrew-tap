# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.48.15.tar.gz"
  sha256 "18f529c9b664ee08def17679fb55e29cd3fa238d1648a19243a88d87d8310b1c"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.48.13"
    sha256 cellar: :any, arm64_linux: "4794f48961e1aa428b8f9552aed3d4a8bc602c336a8bc82ce85667e85be1bf49"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "8f731f95521de021e2c6c235e5afd22036dc4935bb73094c5229623375bd937d"
    sha256 cellar: :any_skip_relocation, sequoia: "0f052b347beb6ef8bf661539c04b34991ba7f747bd0ba399c2ac4283ec0e24f8"
    sha256 cellar: :any, x86_64_linux: "bd35a897bf16156ae198c3a292c44647dc62bae26ecacedb70fe3e37d32fd6e7"
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
