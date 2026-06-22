# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc 'Universal LLM API client with native bindings for 14 languages'
  homepage 'https://kreuzberg.dev'
  url "https://github.com/kreuzberg-dev/liter-llm/archive/v1.7.6.tar.gz"
  sha256 "96e2964fe95494e332453d6e8d83d86c0326d8ae1b38132a5fdb76a309a1f127"
  license 'MIT'

  bottle do
    root_url "https://github.com/kreuzberg-dev/liter-llm/releases/download/v1.7.6"
    sha256 cellar: :any, arm64_linux: "578aed59477562a725c46f7a29ab5b9ea2a05f296e82cf69a8719c161da06125"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ffa4160e4cc3ad99fecf53a50c53ce37279459096e66da0fdc93200a448c40b3"
    sha256 cellar: :any_skip_relocation, sequoia: "33375d81897753da373272150fcd5f8a8681564fe0c44258518ba668fc17574d"
    sha256 cellar: :any, x86_64_linux: "6d05bec960706cef818f291da664df372ae37349ac56ac48b38469f1a197d623"
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
