# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.7.tar.gz"
  sha256 "0e76985f8740f52fdec05743e9eeb326efb4d983864e4fb1e7e790bff115bdfe"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.7"
    sha256 cellar: :any, arm64_linux: "62d01d3b096124d1bf1b417439f69f14d925892e1b0f1185c1592e112007926f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e77fdf23899b79bbe192350a9e106f19a76885fc6ae6d287fceb5d511b40beee"
    sha256 cellar: :any, x86_64_linux: "95ce0419dcbc772998c22371fafb2d1adc39c1029e4dfd034612c38d8bcb5d80"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
