# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.4.1.tar.gz"
  sha256 "ac2494bfab74891f9bf496ec98fb25a5ef00776958df98320dc59734828aa253"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.4.0"
    sha256 cellar: :any, arm64_linux: "87791c24839156881325acc9b055a40ec1dc2f7aa2f5348604f68b948677a650"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3e755b0437ef8418b4502c5801ef4e3f1dc4730de3ab050e5f54b06da35adf3a"
    sha256 cellar: :any, x86_64_linux: "1c41690f1a24c587baa5299db9cdbb04ca30066cf52a2794be9e68749ac07070"
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
