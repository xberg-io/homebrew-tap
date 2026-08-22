# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.18.1.tar.gz"
  sha256 "48e53e00f6702468402a7c833d424c49ebc19dea1ea437e5cfda1fa6f5c026cc"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.18.0"
    sha256 cellar: :any, arm64_linux: "bff58a2052bbde2b9d49837cc6f4f2e367253b8bec7ccc11d832f175d549c7a5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e331b8375fe813f7b1b86c7670bc8b1d363090db3e1128c740cb01a73a5ecc79"
    sha256 cellar: :any_skip_relocation, sequoia: "78d295129c452d965803b8a2ac1231b2c55dfa3020673d284e8999a4b0dd423d"
    sha256 cellar: :any, x86_64_linux: "43e133c28c6ab371f455d2d4b7180f0310921a634a144a680d5587bf05bf7471"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
