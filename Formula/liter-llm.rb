# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.0.1.tar.gz"
  sha256 "b84cd401cfc18e9cb456dba342814590aa7a500b4b32c2d517214a1dece13c23"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.0.1"
    sha256 cellar: :any, arm64_linux: "8525e6cfce530c4144868dd7833cd464c8ce72268f4058477f3deec78a3a951c"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "113b73349a4df51cfb94fbb76c898b722ecbf702d89f54c5b252af2849bcd368"
    sha256 cellar: :any, x86_64_linux: "3c7b062842d6960da1f375a00ffe8e5c7b412e2924a1b0666e6808914a23a95b"
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
