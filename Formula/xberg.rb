# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.0.5/xberg-1.0.5.tar.gz"
  sha256 "d90c9ed3e5c0c7952a14e9acc866b2ecfc9d1205bb652c4389a3eeeed532e60e"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.5"
    sha256 cellar: :any_skip_relocation, arm64_linux: "fe32bc7f2ba182acb67e017b01a3fe36028628023631890b6bb21ecfcecb6481"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "195250e23603b841fef23b1fc78664e5e11da0a0b6cb8fa8c54929a9ddd73e49"
    sha256 cellar: :any, sequoia: "a8592562a2f7d2083bed8b09bbfc791a91f018bcd0dc8c5c077fafe0f884e831"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "57f99941a3079f5200b8f8ab1d5c6129a88b2721c69e51a9b1b99723c734d269"
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
