# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.1.2.tar.gz"
  sha256 "ee4123aaf1beaf7b039d889d1decc9070dde6f9449209c4c4a7cf9b5470b7df4"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.1.2"
    sha256 cellar: :any, arm64_linux: "5963a9d6c68ff07123d0c7fa646d38ad5217da32f320d9c16f0b7f949967af2b"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d323c066982aac2e5fed5603357e8755b6db7c5758906949eba6fcfd74cb63b1"
    sha256 cellar: :any, x86_64_linux: "e721915a02e7fa491713bc2d68f331195671722b1218e770ff8684123b7a7a32"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
