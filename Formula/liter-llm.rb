# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.16.0.tar.gz"
  sha256 "cd33ced84dda7a492b72174de312ea1142facfe4674cd2c28f0a465adedbac92"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.16.0"
    sha256 cellar: :any, arm64_linux: "0508742aea1b96151e3e5d1ad66b1b8905fe039b3d3ccacd7c37c93d4715f77e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "6d14a82b39df12114840213c085a4a1006482467633747a595880a0d62985a17"
    sha256 cellar: :any_skip_relocation, sequoia: "328ebc256160b123a267d8ed4ee7c11f455f5d995912c6928d1f762dd02b19a7"
    sha256 cellar: :any, x86_64_linux: "8b2a617c3befaa38e61d7104ecfafaf27adc2ff52652532afe05ab081222b130"
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
