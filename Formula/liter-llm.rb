# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.18.3.tar.gz"
  sha256 "333f0160e1087ba6f066efabf54b36a588c1bcdb2569d87c251a5dcdc8b114b3"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.18.3"
    sha256 cellar: :any, arm64_linux: "06e794e918fc815e66fb0fddb3854da5a4c9106610214c4df2526ce310d4b73a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "30acf7c25eee13a8372abd725abad2eac40ee18bc3d59e23ef7912c2488dc530"
    sha256 cellar: :any_skip_relocation, sequoia: "fe5d36dbbca3c4054a74917ac857040225da8370294f8b86c66ee289ca6128c7"
    sha256 cellar: :any, x86_64_linux: "56b56bba81a5075a3b67e73f0643b9a0e6ee9111b2bfc2aee8454fa6580614a5"
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
