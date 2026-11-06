# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.0.tar.gz"
  sha256 "e0de10abc9bf9eb9a51c1e5111a84a2900970f87d3aa59363a73c63c4fe20be3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.6.1"
    sha256 cellar: :any, arm64_linux: "ab9b4a5c0c188025b7cb987f1b7dcd1fc571269e1c2606e6f48ae074f7747f6c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a753b7c0d197c7b02325c20e30279baaca3df21f735500fa335fae77001dbd6b"
    sha256 cellar: :any, x86_64_linux: "24a09c1525a0718c14860ab1642d748b2b20f063ac56d777cffb13b787b6b278"
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
