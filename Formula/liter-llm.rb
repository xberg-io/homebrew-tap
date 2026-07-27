# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.2.tar.gz"
  sha256 "4fbc3e58547ce32e4443744fa9d0a624a9965df9cf6f9f51c5f04041ae975d33"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.11.2"
    sha256 cellar: :any, arm64_linux: "e3ae5936bce4f10bd72b3a8db8d611752ec8a34102dfc55c459709046cbe4b87"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f3a844e8fefd8d3c84eac7ba0f576af08fc97887fdd263b4875ef9f6a5b19c42"
    sha256 cellar: :any_skip_relocation, sequoia: "e66f8fd96b35323b9e9bbb94fb3f8da76517d8c5813565604f7e0a550ce3b5ee"
    sha256 cellar: :any, x86_64_linux: "60005a8376e177c663f29c2fe13b5996b1b026acc088d8af52005b883c4312e9"
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
