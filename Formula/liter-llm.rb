# typed: false
# frozen_string_literal: true

class LiterLlm < Formula
  desc "Universal LLM API client with native bindings for 14 languages"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/liter-llm/archive/v2.7.5.tar.gz"
  sha256 "e0fbecdc542550eaa5846bac046254518aa3d804713ff6cabacf4fc05b3672c7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/liter-llm/releases/download/v2.7.5"
    sha256 cellar: :any, arm64_linux: "32078a80269c50afb673f4f7b950b44f81c28bdc5814dfc5dba6a4e02185cd08"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ae324f03be747a4234ab9d95266756c97308efe636efcb86fbf3601d21d4fc8e"
    sha256 cellar: :any, x86_64_linux: "e28607a2bf501d2b15dfc1d46512b4429ddef866b99eefe9b2e4ac5ee7e4c684"
  end

  head "https://github.com/xberg-io/liter-llm.git", branch: "main"

  depends_on "rust" => :build
  depends_on 'protobuf' => :build
  depends_on 'openssl@3' => :build

  def install
    # ~keep Bottles are tagged for macOS 15, the org floor; Homebrew would otherwise target the build host.
    ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0" if OS.mac?
    system("cargo", "install", *std_cargo_args(path: "crates/liter-llm-cli"))
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/liter-llm --version")
  end
end
