# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v1.16.0.tar.gz"
  sha256 "cd33ced84dda7a492b72174de312ea1142facfe4674cd2c28f0a465adedbac92"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v1.15.0"
    sha256 cellar: :any, arm64_linux: "da66f8225d44c04e4172fc1ee4e7637f0b390896ff169fb757965acde7448046"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "dd736eccddc34e1ed68456ae25bae617abfdafbf426d253e22d26824049d99b2"
    sha256 cellar: :any_skip_relocation, sequoia: "ad5e7151d6597ea47de8dd752984a84864e3f85a73742712657c547fbb307e03"
    sha256 cellar: :any, x86_64_linux: "1bbe13d26b6cdb4105eeda5d42de29467f06f07e508215cad474089cff047604"
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
