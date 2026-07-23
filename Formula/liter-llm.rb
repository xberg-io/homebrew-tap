# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.11.0.tar.gz"
  sha256 "4af1dff66b3038dd9d98f2394340414d8575f8e31e4f6741741c621aabc27a99"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.10.1"
    sha256 cellar: :any, arm64_linux: "8da5320ae62af6958fa45d1b99878e41cb369a6d47bc89c40e7265378ac38e7e"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "705b912caf79c236d40056a1e72dd03153f9cbd0731b1d33efd633aa527181bb"
    sha256 cellar: :any_skip_relocation, sequoia: "57b62f66b4bbb3721d4c1720ffcd419e56361083e84871020caea934ddbc6bc7"
    sha256 cellar: :any, x86_64_linux: "db0aaa1282c70b85e0663398a17ac00f659c00e95e5e664759a79d978a06fd53"
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
