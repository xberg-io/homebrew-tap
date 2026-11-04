# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.5.0.tar.gz"
  sha256 "2dc6dc47d29c1cc8cf6d393d042a8af1db35044d543662996997705388e90a57"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.5.0"
    sha256 cellar: :any, arm64_linux: "e5125d2470d0f3c36ee7c6ed83585e33779cab29ba474d71739159c25b1918ee"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "448fcc6ffa206daa78aa2afd11a77e6d3089d9c0be53d637b3fb668509e39722"
    sha256 cellar: :any, x86_64_linux: "e707390c0f064746575e3562e8cd6bf627a14da76dab1f59794a1e2408c1826b"
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
