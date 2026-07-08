# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/archive/v1.0.0-rc.15.tar.gz"
  sha256 "97464b0852eb4b44fb23e7ee687aaa651ea11a87153f3f12002f16a60ab26643"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.0-rc.13"
    sha256 cellar: :any_skip_relocation, arm64_linux: "53c07c3a141e1dc7304a83c5da1a23c752ef738032ebd8b411380cfb7795beb7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "c9c918de5e54eba94019c834405edc48f5be3d4fcee7ec48110949a2d442bdce"
    sha256 cellar: :any, sequoia: "a4b0ff8e81a9017ca4ff77941b5f719c27e80bb5440b7af042f60dd52216651e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "449475721e9757d65dad9dbc5675e2c7e4031f0d4b76c3f59fed4554662fcde2"
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
