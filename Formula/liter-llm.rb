# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.1.1.tar.gz"
  sha256 "e998fe45516f84e389a1fe693eb4c1d8e56f0e21c4196d3d7ae87e38c4e7ac71"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.1.1"
    sha256 cellar: :any, arm64_linux: "44beba280b0593e829daa4ad78be9bf3fc8d968f355c4158009e448ce5f1cece"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7bfb412650240c474403e3ef0a83351b942ed1c5bd3457ea9003d2cb70f69d91"
    sha256 cellar: :any, x86_64_linux: "e22c9f021218ba67c8bb8ee83b0cfa67098de12657afc101654e3071a27d9368"
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
