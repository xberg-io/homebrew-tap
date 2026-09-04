# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.19.2.tar.gz"
  sha256 "f5873b8927adb935578aa821a3bd9a04f620673fab84fd97f26a80e37f30b12d"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.19.2"
    sha256 cellar: :any, arm64_linux: "5dacf748a9dd6973608dce06f3472090aa1940cc0e3a566902f27a74c5392a0e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bccddf88d1a528d5c887ad69dbff3b3ca7c0312bd4b61894a4efe83bf0ab2516"
    sha256 cellar: :any, x86_64_linux: "d4fabbc137af103d96edb410e2c19f5022e980fab3cdc58bd8569c61bab19304"
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
