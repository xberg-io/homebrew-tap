# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.14.0.tar.gz"
  sha256 "788fa91d6a19cf65b56894187ea815be5c3f05abc721135bb8cc734d4bd6d174"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.14.0"
    sha256 cellar: :any, arm64_linux: "237b3bbee6a5489b80704cf36e80520cf80b4ac395672a7f4552fcaa805b5339"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9f5753ccea52a42a3e1a71adec14de194f3e71e0b063b7344d1cbed5b5d110bf"
    sha256 cellar: :any_skip_relocation, sequoia: "a93ee9833a9cea7fde8a4bd65d182e7facaec39af05d25a2bbfaba527f611c4e"
    sha256 cellar: :any, x86_64_linux: "e52b8eedf1e403dae1eea4d40770f257745a3537cf95ab6de4dc68f653aed851"
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
