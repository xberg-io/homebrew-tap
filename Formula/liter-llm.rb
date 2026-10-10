# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.2.3.tar.gz"
  sha256 "c77bf643b34a1b7ade35f26b86fa62858bed6cd59061ea1b55d42f5321131716"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.2.3"
    sha256 cellar: :any, arm64_linux: "f6c60d167dbcf706a33ab556bbd15b074ca390c814dbb892e2a828048b21281a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "018b3053f0b56b40fffe8b47ba7468211010d599cc26bcf11807409bd37f97af"
    sha256 cellar: :any, x86_64_linux: "4872f00166df16b38a6c91a257faa73655d73cff46903f677d8b997bd7d13537"
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
