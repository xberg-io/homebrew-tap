# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.0.1.tar.gz"
  sha256 "b84cd401cfc18e9cb456dba342814590aa7a500b4b32c2d517214a1dece13c23"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.0.0"
    sha256 cellar: :any, arm64_linux: "c888555ac7e8aca401952c1579d7b553020d03bac7b14d287b255e292fc59c4f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "d0e5385bf74791b2a7eae0e86b6606145064c0c2298dcd4b7b311e7074e20e64"
    sha256 cellar: :any, x86_64_linux: "05e28562503da7f91eadcef2c71043962573c0153b9cab79d4b14b307756058a"
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
