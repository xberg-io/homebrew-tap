# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.10.1.tar.gz"
  sha256 "cdcbc79f8d4f7078a5bcd5c84fe381fc8b8b544ecf53924c990d795cd402ad57"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.10.0"
    sha256 cellar: :any, arm64_linux: "097614d5b6f72d6e737b22b11bf61201df6e164e8df3620c8b81dd45f4644feb"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2007df8b563421648588c39f378105ac1b2c3ad8d6c10250c8c478e7737a6352"
    sha256 cellar: :any_skip_relocation, sequoia: "89bf1d60e71732bd9837f245663fca9e4f49e2bef7a5bee32997148ebea1d3bc"
    sha256 cellar: :any, x86_64_linux: "cec01f84eb30609aeb43341318de30b121ccc47f00f0ac7fc63b4d37968be4e0"
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
