# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.3.0.tar.gz"
  sha256 "87d1f9948d2989f9dae77ef1201f62e7f55235ca02ad2759592888a6e0892075"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.2.4"
    sha256 cellar: :any, arm64_linux: "9e4cb7bb53f3e64f1cd7a05410bf6c43fddf792a982db4bddaefee6995d7289d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "ac2a6040ab3f319195e38ab49b8181607ae2592e97dd074380ba5f2cc203fc56"
    sha256 cellar: :any, x86_64_linux: "4254d762703a35826f66b29f8e3f68694d0e5463c92dc42a4ba4e23ed22c6da9"
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
