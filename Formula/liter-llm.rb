# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.10.0.tar.gz"
  sha256 "52eece071c68bd8e2fd0f7374c15afc5e7427867027eab808b03a9c03a952f46"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.9.3"
    sha256 cellar: :any, arm64_linux: "5cb7e16b1cc629ea6644fc2a6d93b51b7413af1667b0cd47aa6e0e11fee647b7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2bf594ca4757cc442c693413e048a90920046a72fc1830c73c0b001ff932991a"
    sha256 cellar: :any_skip_relocation, sequoia: "b0ca3e402a05582274eff72b2a6eb8f188f99592185ef5d2628b16d2eb2aa40c"
    sha256 cellar: :any, x86_64_linux: "fe570a9fcd4c31ec469b19c490aafaad86b343be3c87827d33afa59706e15a8d"
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
