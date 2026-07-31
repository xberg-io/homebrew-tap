# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.0.5/xberg-1.0.5.tar.gz"
  sha256 "b819b037c22aa300da9535d6bb3e447bc0beb390dc7ce7aef747305888f9b504"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "e4d44a2d8d4d8fa062d996638899420c862a125d7d481547c0f8c922b714dca3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "2e10eb5f97762750855b5b3060ad06418bec8077866ae8a5b8006bfd26ba1abc"
    sha256 cellar: :any, sequoia: "50387f68e88f0f83899dc42ab93510997ed9fa21ef1c92401efc0ed184686c1b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ada00c57622c57f97b976febcd74eecff3207499144ebad1d5e1fe99966555db"
  end

  head "https://github.com/xberg-io/xberg.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "libheif"
  depends_on "openssl@3"
  depends_on "tesseract"

  # Intel macOS has no static ONNX Runtime prebuilt (ort dropped x86_64-apple-darwin
  # in v2.0.0-rc.11; Microsoft dropped onnxruntime-osx-x86_64 after 1.23), so that
  # build loads ONNX Runtime dynamically from the onnxruntime formula at runtime.
  # arm64 macOS and Linux keep the statically-linked ONNX Runtime and need nothing here.
  on_macos do
    on_intel do
      depends_on "onnxruntime"
    end
  end

  def install
    ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix

    if OS.mac? && Hardware::CPU.intel?
      # Build with load-dynamic (no static x86_64-mac prebuilt exists) and point
      # ort at the Homebrew onnxruntime dylib via a small env wrapper, since ort
      # dlopens libonnxruntime.dylib at runtime rather than linking it.
      system(
        "cargo",
        "install",
        "--features",
        "api,mcp,mcp-http,ort-dynamic",
        *std_cargo_args(path: "crates/xberg-cli")
      )
      libexec.install(bin / "xberg")
      (bin / "xberg").write_env_script(
        libexec / "xberg",
        ORT_DYLIB_PATH: "#{Formula["onnxruntime"].opt_lib}/libonnxruntime.dylib"
      )
    else
      system("cargo", "install", "--features", "api,mcp,mcp-http", *std_cargo_args(path: "crates/xberg-cli"))
      bin.install_symlink(bin / "xberg" => "xberg")
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xberg --version")
  end
end
