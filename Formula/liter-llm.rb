# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.4.2.tar.gz"
  sha256 "afa9ab9e48b79dbcbe8060b4085dd22d952af5b441b19a8a4eb71522f3798f31"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.4.2"
    sha256 cellar: :any, arm64_linux: "d0a7f75790a0a5090945172638e1c41424ca17c0e6f11e0f65400d10698f6e92"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7ac5460164cd7137b4179f39d1cc38ba45b36d53ecee2c7c1dd12c0c88bf3ba8"
    sha256 cellar: :any, x86_64_linux: "7961bf3b58d0425d28f6f39b0385769610c56c079cc07c18e4fe78e278d3aac5"
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
