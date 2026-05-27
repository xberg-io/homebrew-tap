# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.38.tar.gz"
  sha256 "f88810ec081b4088db1e5bfcf596365763c7a49aaf7f66786fb6266272a17eef"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.38"
    sha256 cellar: :any_skip_relocation, arm64_linux: "bb88e7da80d74f7ae1268360a43364a464cf81d4dae5b98eda0844ca3256663e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6f429ad9cd5329865c9bc88a697ea5680f43a19b2e791c60b923f7bfd7846f5f"
    sha256 cellar: :any_skip_relocation, sequoia: "58ed960548c6aac26ffa58e7f81db09ba57e654f78e429c088228431e7bf3fbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a8603c5a8b60409b5421eeb97d9b90e33b26121b7395f951522cf49e032fb2bb"
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
