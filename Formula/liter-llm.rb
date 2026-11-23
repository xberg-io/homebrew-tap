# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.4.tar.gz"
  sha256 "2b339923836e198ed92a08fec56160deef158b511c963536a156560d5fd53cf2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.3"
    sha256 cellar: :any, arm64_linux: "54e59f8e891d8f18d0a57ae0d7b89b18634c63a1c48c2ad3a9ff10831787bddc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0ada226e4614f32ecc0099da9a00d4658c030ac04be7693d8da0224fdd3622ff"
    sha256 cellar: :any, x86_64_linux: "40505d144711f58afb0a28ea3cb068b5a4e1da2534f8fb4444025aa6143859ec"
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
