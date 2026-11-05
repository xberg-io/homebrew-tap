# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.6.0.tar.gz"
  sha256 "89d3c7d12db66c46ff79c2726a611673877b09a3c14c14d892362bc53e2501ed"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.6.0"
    sha256 cellar: :any, arm64_linux: "4f19954ed78b9ba6ea851dffc1fbc890092406692ab3f084026c007cd94fe291"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "077121746a45e7831b6d30955b3be0ca897d935944d855e1c2417ef3f9803a32"
    sha256 cellar: :any, x86_64_linux: "6228bc13d66144d7cc64e503ccecd81e4a031c6dfa394b6fe5dde11677554221"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    # Homebrew clears MACOSX_DEPLOYMENT_TARGET, so set it here: the bottle is built on
    # macOS 26 and published under the big_sur tag, and must run on macOS 11 and later.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "11.0" if OS.mac?
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
