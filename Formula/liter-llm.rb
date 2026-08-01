# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.12.2.tar.gz"
  sha256 "65a34f4b8d0bb7832adf714d8ea444232d8f786ecb90c5066ba57ad27e75631e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.12.1"
    sha256 cellar: :any, arm64_linux: "f76ac4fb3d1a4e60c2692d001f63b1a5611f4bdffbf2feef84df83893440c792"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "f1b99d80ee1b6e0bc5229aa4dea84a6c08170182eda5530cb313370f8663ab05"
    sha256 cellar: :any_skip_relocation, sequoia: "1024873945180c6b1f45352c0987540ab45dc58db6adb9f99a0780908cc59003"
    sha256 cellar: :any, x86_64_linux: "659e4f46e0a1fd06bd49ed94dd4cb2b6623a373ec4fffff5ac32cb6db8e60225"
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
