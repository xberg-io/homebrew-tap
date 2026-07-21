# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.42.0.tar.gz"
  sha256 "812f17ba9cc44d7c6d3cbb58a03ba640824e22a918eb4bef4040337391b46b73"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.41.0"
    sha256 cellar: :any, arm64_linux: "76176dc09ef2d25da0b10afb8d5d60dd2a58a8f6a867fcfaafe38d9a5787edef"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "df639529f6bf52efdb413a44a2b28c9426a728249146d508415ce4fdb56070ef"
    sha256 cellar: :any_skip_relocation, sequoia: "9bce52f0c0a528eb548093f5040ca7edc7a00d04a2344269f45fedd5bf0d5f62"
    sha256 cellar: :any, x86_64_linux: "9d1c1a4a07ec6b6819f1bfb325166a871addffc2810d18e654489f68ff0c7722"
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
