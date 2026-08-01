# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.12.1.tar.gz"
  sha256 "dbc7c5384c173f1c9147abb9cbb6d84af433afb62bdfb36d76ca2d13de7e77ec"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.12.0"
    sha256 cellar: :any, arm64_linux: "9ce5b677c5d557d6f243e56fb65cecdf28e6627e85f35a5e6f2a211322ddd0d2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "1345bc37a3d32fc5aa7a397dbb8ad585f38c3475b8adb8d0580338aa5d2cac02"
    sha256 cellar: :any_skip_relocation, sequoia: "5b22f3f786d56df3d3631ab58fbe590b4b4db09837c956d4acb2f70bee0c8b50"
    sha256 cellar: :any, x86_64_linux: "9b55d9655eaca7cecd01fe83c0f16ceb8ad443f35850ea2e0d9e561b1babbc33"
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
