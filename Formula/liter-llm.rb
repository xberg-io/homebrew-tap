# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.5.0.tar.gz"
  sha256 "2dc6dc47d29c1cc8cf6d393d042a8af1db35044d543662996997705388e90a57"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.4.4"
    sha256 cellar: :any, arm64_linux: "93f93d606c58b54f76ccaec27230d58b7f6442629330b18dec334c3be634999d"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "bef34e827d2092d7347dff0004ac59220a2d478e60dfb3c73b68435a7e86f293"
    sha256 cellar: :any, x86_64_linux: "e8ca8908fa6066fdda8d623be9d5442781bf867cc812ec9626d8917be8591b3c"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
