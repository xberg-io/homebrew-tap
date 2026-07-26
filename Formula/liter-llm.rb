# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.2.tar.gz"
  sha256 "4fbc3e58547ce32e4443744fa9d0a624a9965df9cf6f9f51c5f04041ae975d33"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.11.1"
    sha256 cellar: :any, arm64_linux: "10aaf50b37513d90bf02a032cf27dd773d08886d7a95da8c2f594f9b30926732"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "02d8017872e693946dba74e50e500784ad5faf3f7c425905946bd06e1e2b789b"
    sha256 cellar: :any_skip_relocation, sequoia: "17ad81be31c04fa35f931118aed1344a48979d8d816c17512ba81fac9623af90"
    sha256 cellar: :any, x86_64_linux: "57bdcee3ae91d6df8114714bdb72bf16204ede1eccedcbebec0c8518cfff4b02"
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
