# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.41.0.tar.gz"
  sha256 "4f1f4e918f1332d05f5372d6bfa9e456d9b9558134564726ab15c2121191f58f"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.40.0"
    sha256 cellar: :any, arm64_linux: "b032867736cc0fa4e4988204ebe50846a362d98f56d3100848770c4bb958d5af"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "99b4b64c5072c07247daea9ff4c1f7c6610518eb512408adf21af6c02156dac4"
    sha256 cellar: :any_skip_relocation, sequoia: "3db4ebcae71f3a4b8ee356156c4c294eadcbdc39c9154e0c42a2f9cd86ea5592"
    sha256 cellar: :any, x86_64_linux: "eed592551b66d413988666ec9555a159eacd575050df4a203498bcac9bda8450"
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
