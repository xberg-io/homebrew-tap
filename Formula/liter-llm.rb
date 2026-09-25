# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.1.0.tar.gz"
  sha256 "fd44819ed188f8cafc696c66eccd4c8490e875d335ba0aff9ace2e5bef118012"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.1.0"
    sha256 cellar: :any, arm64_linux: "a4a1f5cae90e2cbe10c435da01dd40f31e05d3fcbaeb7bd703941e8cca777c88"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7d783fc2011a6adbe1fce32e03598846bebfe3c69f95b10900e993c5a2ae6dff"
    sha256 cellar: :any, x86_64_linux: "446eea536f9f67ecbebecc59978703a888011b71184fad32d970a4899ab3c591"
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
