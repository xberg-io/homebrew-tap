# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc 'Opinionated polyglot binding generator for Rust libraries'
  homepage 'https://github.com/xberg-io/alef'
  url "https://github.com/xberg-io/alef/archive/v0.32.0.tar.gz"
  sha256 "9c7da89b15a043971786a560e85f6e4c20b235a3d0f69f95ceeb277a75d22a88"
  license 'MIT'

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.32.0"
    sha256 cellar: :any, arm64_linux: "7bfa1b3ac4e8c560d8baedcf7a412ebfe13ff73918045a9769119489111fe6cc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ccc39d88e4c31602227fb224cddde2455104e78cca6c03c67460acd2bdfa36d5"
    sha256 cellar: :any_skip_relocation, sequoia: "b131043609a678795749df16a764e03358b8b610caddb04143372c42aa347690"
    sha256 cellar: :any, x86_64_linux: "1bfe8eac0a6722ba64e88c226180ab1e98e4506053d62f1e3969b74a62da3155"
  end

  head 'https://github.com/xberg-io/alef.git', branch: 'main'

  depends_on 'rust' => :build

  def install
    system 'cargo', 'install', *std_cargo_args
  end

  test do
    system "#{bin}/alef", '--help'
  end
end
