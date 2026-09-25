# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.1.0.tar.gz"
  sha256 "fd44819ed188f8cafc696c66eccd4c8490e875d335ba0aff9ace2e5bef118012"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.0.3"
    sha256 cellar: :any, arm64_linux: "ec0e6985633d31a3274409c7f3138fdd15651f29c7bd5ed34ecec09a5852efca"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a9e013c30e925dcafe2f116e3dde986e84d01063a81cb28931110e5726f279fe"
    sha256 cellar: :any, x86_64_linux: "5a9d93594d26653c7e8d476b4e4957e3b9941870b7967698674ddff616361413"
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
