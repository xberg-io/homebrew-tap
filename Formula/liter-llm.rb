# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.4.tar.gz"
  sha256 "2b339923836e198ed92a08fec56160deef158b511c963536a156560d5fd53cf2"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.4"
    sha256 cellar: :any, arm64_linux: "2489cd9667fc085da1ecd48082e2a910fe592eafa9e07f64783d19660b645ca2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4f842c63ce60a7a2d6686642821d86c8987146bc3f2031ba42f3221a88c8ffca"
    sha256 cellar: :any, x86_64_linux: "4d26fc57ff0d052942854296d252f71bc84508d6ba00d64ea14da35ca32bac4e"
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
