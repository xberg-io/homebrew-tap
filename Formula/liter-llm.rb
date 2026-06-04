# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.58.tar.gz"
  sha256 "274e93a4c337be252cb92e209fde4dec67ad0aed794881e38f869821f25999c0"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.57"
    sha256 cellar: :any, arm64_linux: "a4b1fa48024cc1a35a37c1fd044cf60ce4604a660b1e8b6bb624d189bfc1c7bd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dd920b007e0bd147d8b72408a45ab1796004ee30e7a14001421c5f3a7e717429"
    sha256 cellar: :any_skip_relocation, sequoia: "687c1bc04941c5e4f0683d95525fbc8651d16e81204c8b18c8f82dc4ee725e67"
    sha256 cellar: :any, x86_64_linux: "f96c0d3186aaf2e1963ba93436e9947177bbddce067a7be6f6a31fe05eb511c4"
  end

  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
