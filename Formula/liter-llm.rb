# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.3.0.tar.gz"
  sha256 "87d1f9948d2989f9dae77ef1201f62e7f55235ca02ad2759592888a6e0892075"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.3.0"
    sha256 cellar: :any, arm64_linux: "68eb66c00c6ac1b674b38cc1c0aa6c602eb4019d0e0279ae3fea30a99219d0b9"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "5b2c43c39e52ac2b5a9c955adbedf168f3cd85b605034e8a9d6efa5683f89d47"
    sha256 cellar: :any, x86_64_linux: "0358746c75778ea0afc9ff42658e249205a7e415e3bf02bbd3e014084dd573f7"
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
