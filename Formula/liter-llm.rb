# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.3.tar.gz"
  sha256 "938e8cbe933551f2667b49cc08b898831eadc94bda5dc062731a49c8bd231d4f"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.2"
    sha256 cellar: :any, arm64_linux: "fcb34fecf2f82bdd68817ed901cc29024213f100a415a29b6d311d049533fd85"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "78a35ddb65e0927592e559ff0cc40ce11f1ca62cbb14fa8b0fb94870408816b7"
    sha256 cellar: :any_skip_relocation, sequoia: "6889cd8f755951d5e6991d94742aa52ebcd89f526c98bb370c02a3a845ae57dd"
    sha256 cellar: :any, x86_64_linux: "6363928f269967569e2957133a38847b42bc0fd0fdf698d70a90ffd3ca02db01"
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
