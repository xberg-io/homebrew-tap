# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/refs/tags/v1.18.1.tar.gz"
  sha256 "48e53e00f6702468402a7c833d424c49ebc19dea1ea437e5cfda1fa6f5c026cc"
  license "MIT"

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.18.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "566aecde2303f46ed5b2265627ae73a2f8cd3e230aa9d9e81297cd963cb17417"
    sha256 cellar: :any_skip_relocation, sequoia:      "7bf8c7327a97e098faa095241eae1e2314e627a353d111aeb7c11241d1b4646a"
    sha256 cellar: :any,                 arm64_linux:  "64cbe5768abef07c39ec35fb7b76f7ba367e0d5a232fcb81f14618dab12e26c7"
    sha256 cellar: :any,                 x86_64_linux: "4d2dad238c592094fffb98ab1dd6ce3eff33bd4bf67d98c14a07470b65419c96"
  end

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
