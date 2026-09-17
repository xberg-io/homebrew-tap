# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.91.5.tar.gz"
  sha256 "d03eaf543a78b1782dabac878d054b190bc42bbd4a4d22962f174d09315f0c63"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.91.5"
    sha256 cellar: :any, arm64_linux: "d66c7f165a7c571a2432797357e20d3c75cf06f93a2721358d90bf1baf65b304"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "477e9d352c0fa43ac1d7a55870b17115314603cc9d403a8c156e50c241b24e73"
    sha256 cellar: :any, x86_64_linux: "38832d7a689cb231b0f14e71eddfcd6636487907bc80412615ae15634dab539d"
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
