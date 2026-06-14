# typed: false
# frozen_string_literal: true

class TsPack < Formula
  desc "Tree-sitter language pack CLI - download and manage 306 parser grammars"
  homepage "https://github.com/kreuzberg-dev/tree-sitter-language-pack"
  version "1.9.0-rc.46"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v1.9.0-rc.46"
    sha256 cellar: :any_skip_relocation, arm64_linux: "00035b5501993fc1f11ef7067bb3fd76228978778c5215a4f7eea864440e1dac"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8ec33e0a4f2284d0f979b7f8cd19f63cf3bb54ae661d5186b69f48a1e40ea8c1"
    sha256 cellar: :any_skip_relocation, sequoia: "b477eba48ffdb9f2b08cd39127c088252332ffe0c4c6ab3270e032f91300c16a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff3c333717d4b0b9a836fb83d25e21f26cd04c16b56a77fe2f35442e54371d75"
  end

  on_macos do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-arm64.tar.gz"
      sha256 "05067d68f814a5bffca681d2e8b7bad5f7d38df0094fff0ea03c45c67268706b"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-macos-x86_64.tar.gz"
      sha256 "a0a74b65a741c659b1ae0ad1957ea183e8b6bb2be7df1417f478b0a58cb01d31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-aarch64.tar.gz"
      sha256 "54a984963d74244a0ec21137b73ad714fdd84b990f33298da5e2081791b739b4"
    end

    on_intel do
      url "https://github.com/kreuzberg-dev/tree-sitter-language-pack/releases/download/v#{version}/ts-pack-linux-x86_64.tar.gz"
      sha256 "0549cd55420a294892e6c81bdd88c87204530b11ae67e9fb1b09bed487b4b0a1"
    end
  end

  def install
    bin.install "ts-pack"
  end

  test do
    assert_match "ts-pack", shell_output("#{bin}/ts-pack --help")
  end
end
