# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.4.0-rc.53.tar.gz"
  sha256 "05eb5b83e5af87c6d7360cd72e453401a85f2868c9561a287428ac6664d41c2b"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.4.0-rc.52"
    sha256 cellar: :any_skip_relocation, arm64_linux: "d8e3b3b7f29e57ec4ff81b13824d1c3197961b72db5062e42332b37866f82500"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "11592a65d01efb6591616789eb62526a8067e6f5a42d732a08b5d845f514f3cf"
    sha256 cellar: :any_skip_relocation, sequoia: "c036e5e03426bea5f67e6eca0334521571d12f5d314c9f21e4c4b0c96f3a5a14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "59c64a845269b02886e7098b7b90cbc1580474d4f5afc11306c9f5f74cfcbe33"
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
