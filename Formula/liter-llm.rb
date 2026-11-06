# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.0.tar.gz"
  sha256 "e0de10abc9bf9eb9a51c1e5111a84a2900970f87d3aa59363a73c63c4fe20be3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.0"
    sha256 cellar: :any, arm64_linux: "a76e3290fdeb661ecbf802143ec9c581d3e99acdfc248a3a1f893fb863ed93c2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8921174442dc6750d175f29356eead9d83a2fa0ef018b6b99dcae053c6a04f61"
    sha256 cellar: :any, x86_64_linux: "6f910e7bfdffdffa239af4a32bbc380b446a3971072e3a96a176eb8675bf66ac"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
