# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.32.tar.gz"
  sha256 "c2222bfc2b3bb584173123591eb2cd48b6b3aa606b82724259517b01d1177686"
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.31"
    sha256 cellar: :any_skip_relocation, arm64_linux: "1e7154f31dada683a0aca5d1e9768b9fecaf7b8cfe6c3443e45547c72649a8d4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fb872038f3ef929a10d857de716325a89e61a99e69eb97f1a17f77328d479720"
    sha256 cellar: :any_skip_relocation, sequoia: "9d041dd130f05dbc12f2097b550c0d33fd731e6fd79bf14a78f888258490cc14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5dade6f74455035799e08f24ec657f9abd0bf1c7812f77bb99956765ce16e15"
  end

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
