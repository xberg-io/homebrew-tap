# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.4.tar.gz"
  sha256 "0cd24128a1a7435797ee4d683e74fb3bed0baa876bb208b36f35193cc8810eb6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.11.4"
    sha256 cellar: :any, arm64_linux: "87c5be2da6becccd274c7ced2f402f36c8af42646041a9b2d874966984a8f5d3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1127fadc1479ac7d4bebc2b8d66d33ed5f08e2d18792b24eb0b49632f3c293d3"
    sha256 cellar: :any_skip_relocation, sequoia: "5c99b0afd06970279b291dbf4d78fb5f9991fa19f4a55c8abf823d51b939132d"
    sha256 cellar: :any, x86_64_linux: "4de315ce360ba53481ca6595f3e64ad93c610f7a616d72275e0bbf192b6ebf5f"
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
