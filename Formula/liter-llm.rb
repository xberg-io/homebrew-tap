# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.48.tar.gz"
  sha256 "520b315e2478d1b0dfe80c8bd79da63729b4cd068e34db928433831a020a7e3a"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.47"
    sha256 cellar: :any_skip_relocation, arm64_linux: "5241c68d235ef75a927a752a408c11b0fc2f7b371c9598127a5a200d81bd26bf"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "232c3c5ce11cb092f57a06c00b23d3cf8d1036a901ad12a77e17862ab1592bda"
    sha256 cellar: :any_skip_relocation, sequoia: "17b006c55701885ef3bf70d7e8f657a41841d104a1de6e7b68797bb9f6dd5ae6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6e34373b0e022fbe029dec698611be7dd390f0721801565b34c67a1296315535"
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
