# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.12.2.tar.gz"
  sha256 "65a34f4b8d0bb7832adf714d8ea444232d8f786ecb90c5066ba57ad27e75631e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.12.2"
    sha256 cellar: :any, arm64_linux: "595f98993978090f0bb4424ce7adb81ee6050ab4ca32a7320453ac99dd2617e5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "076aafa60ab92bf31117dd2d274512f06555e82c595937d07b8d352ce9ddad3a"
    sha256 cellar: :any_skip_relocation, sequoia: "0ae578f7cebcb42fdddd263f7ec1856ee203224205c231c3cf9f0dd2e0bbba52"
    sha256 cellar: :any, x86_64_linux: "44321c6ff51a0137475661dd54d845fda200601b00e8f0d1c2876cd42a059d8f"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
