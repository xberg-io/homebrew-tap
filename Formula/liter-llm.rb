# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.0.tar.gz"
  sha256 "4af1dff66b3038dd9d98f2394340414d8575f8e31e4f6741741c621aabc27a99"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.11.0"
    sha256 cellar: :any, arm64_linux: "2ddae3c23f1f338f1971c0d79909b13f97c7ee51510b29b30d7e6c30893809f4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b3944eee9b27e108cebf0e3b72ff8f9820bed8c8b68eb64dab4f79ea70b69de2"
    sha256 cellar: :any_skip_relocation, sequoia: "b9b7fe49d2f063bac8b3deb24e8d3d197afeeda29c9ba123efb71f03ad72af4c"
    sha256 cellar: :any, x86_64_linux: "ee570b38b17886aa2a454de0a16f99ea8a2a28cb7ea6bf34a9a7ae6d5e4e08fd"
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
