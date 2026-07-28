# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.0.1/xberg-1.0.1.tar.gz"
  sha256 "a2e3ac73c051476625ec3f540c523553be2086282d3808c3f32979067a070ee6"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_linux: "31a7b29bfc8366e6b40de872b34fee9cc8125ce5e0abdd2785069b527404789a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "7eabd134fb823a5141677e59cff20095ac6f2e5ce63961103410880de83b1a9d"
    sha256 cellar: :any, sequoia: "73d449b294594297e902853f9b394e2648e56f12ceb90a32bb7cc4711b66be24"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed63926521177a8319651b37d14f5867a36e3a5a265ce9a1ea2393bcc84b8faf"
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
