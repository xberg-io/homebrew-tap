# typed: false
# frozen_string_literal: true

class Alef < Formula
  desc "Opinionated polyglot binding generator for Rust libraries"
  homepage "https://github.com/xberg-io/alef"
  url "https://github.com/xberg-io/alef/archive/v0.52.0.tar.gz"
  sha256 "8b57afff06d2a11fa8bc73390cbe0c727720c0e513af23c64db7bca375dfe776"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/alef/releases/download/v0.51.2"
    sha256 cellar: :any, arm64_linux: "29ee7e7f90a0ed275eca089bda17b30769b8eadf04a1e14bb1aece7aa44dba60"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "3ff90a022075c7fcc38533333bbaf68caae982174081d52c6056e401b9842a88"
    sha256 cellar: :any_skip_relocation, sequoia: "7f03ee208d37bb53085adf4288a7e11d52a645a20920f1c5aeed1bd3f782c4df"
    sha256 cellar: :any, x86_64_linux: "20a7a8351afcab13412dcd9e96ec2b638e8ed0fa5b4e026df37d6d367381a702"
  end

  head "https://github.com/xberg-io/alef.git", branch: "main"

  depends_on "rust" => :build

  def install
    system("cargo", "install", *std_cargo_args)
  end

  test do
    system "#{bin}/alef", "--help"
  end
end
