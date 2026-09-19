# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.0.3.tar.gz"
  sha256 "12bb81ac1cc7234d2b47237a1cb694daed155024193962ba4ff4637848ed9b0d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.0.2"
    sha256 cellar: :any, arm64_linux: "7630ef93e738dd7a95b4b1c0073cdf126bb1a22b69d2cfbc8e70f092b2e410ab"
    sha256 cellar: :any, x86_64_linux: "06c1a19bf97dadb915a39e1e37fb62453a402d571c55424eb3bebfc46c519c43"
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
