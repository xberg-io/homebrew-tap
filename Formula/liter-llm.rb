# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.13.0.tar.gz"
  sha256 "61b6bd04c42a5428cde1b141c70ada2f1d82859642d1bb8a1243e3cd96121680"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.13.0"
    sha256 cellar: :any, arm64_linux: "f625662263667ceb8b08fd0c6cd608e3b7488389ce137312f39dbd5ed9dc0cde"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6e10d4ef80215b8f9c9267ffad5d9b6b1dcd062e92751a7cfe0faf6c23de40ff"
    sha256 cellar: :any_skip_relocation, sequoia: "e66fc64dc9ed469f997624d7d03bb78a29c6b8e40c5104d7dbb058a61b98977a"
    sha256 cellar: :any, x86_64_linux: "3e37f74a5f12225542cc3bc9af941433642c94cd155747e9293f29098f5696d1"
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
