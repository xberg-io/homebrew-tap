# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url 'https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.27.tar.gz'
  sha256 '4e5b7931a316f6ed6816cfa1f4e4e5203dcab7edb9b4f945a24b2caf61c89e4c'
  license 'MIT'
  head 'https://github.com/kreuzberg-dev/liter-llm.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args(path: 'crates/liter-llm-cli')
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
