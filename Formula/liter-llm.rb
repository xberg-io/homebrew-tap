# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.4.1.tar.gz"
  sha256 "ac2494bfab74891f9bf496ec98fb25a5ef00776958df98320dc59734828aa253"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.4.1"
    sha256 cellar: :any, arm64_linux: "08c92ce35177cab8ca5f93459e2702710ea7daf75ddba3145f5eb9bca61a7118"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "a52c73b9e0919720633bedb5c7e173fab1c437f863e27226d39c37c2b692560f"
    sha256 cellar: :any, x86_64_linux: "464dd927b37209b8bbd408aa5557cdfc21e92477302bcc1d9459e95f8167b98b"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
