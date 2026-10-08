# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.2.0.tar.gz"
  sha256 "0d6ad24ce238b60e230be0e9f3af3aec4a01d41468c31e9984fde939892c34d0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.2.0"
    sha256 cellar: :any, arm64_linux: "c2f16bb524ec660eba51927c465faedff119cffc32905d5bd36660441ec611d9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "140d0889b4b04c5a753116510c41db1aa7b863b30ef72bde0fda665fa9ca74d3"
    sha256 cellar: :any, x86_64_linux: "ab45cd08d8a0addcbc194b178ff30f74e01086d8acf09af345a3cc76647d9140"
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
