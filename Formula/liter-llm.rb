# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.46.tar.gz"
  sha256 "0ee5384eab84a371e6438644018bd9aa2c7eeefbc1a16a766d21e5a56a8e633b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.46"
    sha256 cellar: :any_skip_relocation, arm64_linux: "9b9197e6f19f9d25d1237df1ddffca62f85ab6611c19049e714039a5d9074546"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9b10232a7ed7619a3ba6a2dd672df3b30d39714f06a1e67b8853552290b64161"
    sha256 cellar: :any_skip_relocation, sequoia: "93d4e1d39ca253ee9d58ebff36bc3e368de5daa62b566a41b4bb44894a751492"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c52fe0105e477db2dc772f68bccd0e145fdd364a1bda34e1775e804bf9b3ecb4"
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
