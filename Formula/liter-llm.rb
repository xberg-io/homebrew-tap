# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.18.4.tar.gz"
  sha256 "790e561a368e58a27e46c339f96e28e9e5dd6a6e7a05a167cc8c3e4a05ee7075"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.18.4"
    sha256 cellar: :any, arm64_linux: "69fd2025d876216cd7bfbe242c47f5775ecbd92b688c92a7c3ab0f15b2ff1685"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "fd090265875c9332885bac1fc4c6c1cb5355217d554c1c62444cbc96298caeb5"
    sha256 cellar: :any_skip_relocation, sequoia: "630c5703c5cd036d43c36a7d6ddcdaffeeef0f662f346fe8dccb98f22958bd48"
    sha256 cellar: :any, x86_64_linux: "ca3369e9f6872297ce1bca7484841d5d65071944b9176708d2914ee898b387fd"
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
