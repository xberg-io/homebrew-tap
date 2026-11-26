# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.6.tar.gz"
  sha256 "7da4a1529d60aa0d041ce1136cf20fca10dd3f7d34ef7fcd27764184ab085165"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.6"
    sha256 cellar: :any, arm64_linux: "2bbb8edceca3c32386c828cdf31bd4deb3850d59eb1d80f173c87fb9b89fafa4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2fb44c0ebe7d52e3306c2e159dfeec5ed19a5196baa9b9b0312d448ef13f1df7"
    sha256 cellar: :any, x86_64_linux: "6a128ddd6bf661b99ab77b52c3cfe632e38ba51e70ff0b58c5a5f569504f40df"
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
