# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.4.tar.gz"
  sha256 "0cd24128a1a7435797ee4d683e74fb3bed0baa876bb208b36f35193cc8810eb6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.11.3"
    sha256 cellar: :any, arm64_linux: "c42675fbd1a647057aa5a441c9795f6ea6d083f5431d7c0b5a6c1bf1454469ed"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e15f17b852b21e0d4ac35ab9e66cd9b96b976e665a90a319f72e673092c45429"
    sha256 cellar: :any_skip_relocation, sequoia: "d38d3089ad9bac0727c2156075a33397a36fe40fd05483127322880760abb196"
    sha256 cellar: :any, x86_64_linux: "4a4a15f43f44d83dd210df3aca3f5e9780efb8fb55018093fb2d4371596f2314"
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
