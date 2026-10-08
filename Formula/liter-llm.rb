# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.2.0.tar.gz"
  sha256 "0d6ad24ce238b60e230be0e9f3af3aec4a01d41468c31e9984fde939892c34d0"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.1.4"
    sha256 cellar: :any, arm64_linux: "66af10e6e4570e52def524d4246fb9816bc263e3c128cd25d338e3b592de5375"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c72fa991f7e20e1d3073313b8c83b33235c27db6a14480a0cd9e41077189b492"
    sha256 cellar: :any, x86_64_linux: "a954a03463b1351a6fd886dddd2ac1f1e0665ba73af9afc48977c742b0238fa4"
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
