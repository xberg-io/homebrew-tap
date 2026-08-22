# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.18.0.tar.gz"
  sha256 "f33fd7638b719fbfc8bc39180ed8dc24908506f173b7ee4205c4be9a8af5d0b9"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.17.3"
    sha256 cellar: :any, arm64_linux: "f185d19f2df3ec623a6f56e12217775fe99bb25bd6b126566351f225d621867f"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7298445b4c03113ac341632464b09d11ff4e3a5937f8fb2655eb4e953342901c"
    sha256 cellar: :any_skip_relocation, sequoia: "007a97d009338d173a8cb40ef283743335ea35c67c85ab77fd7155fb0d7f3a5c"
    sha256 cellar: :any, x86_64_linux: "cb6bffaf1c115408b51953e08a5d8ac121ef5937bdc8f2fcbdd211323f2fb5b8"
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
