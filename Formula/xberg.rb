# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.3.10/xberg-1.3.10.tar.gz"
  sha256 "d38be1f2984ef2861597c1398cf0d98ec661f506cd1fb21d801071e8a67b0b30"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.3.10"
    sha256 cellar: :any, arm64_linux: "931f1418d81eab97816e0a5294d7751520b88efccbc0e5c3530b529c7391d573"
    sha256 cellar: :any, arm64_tahoe: "43e997d5bf9350144f1ee503bb34391902312455d81ab2afb6ac2890cf05bbb2"
    sha256 cellar: :any, x86_64_linux: "3ec144e6fee1c20a50147a0eb9209a0cf5d879d00c98595c6de69f72279a11a4"
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
        "api,mcp,mcp-http,ort-dynamic,heic",
        *std_cargo_args(path: "crates/xberg-cli")
      )
      libexec.install(bin / "xberg")
      (bin / "xberg").write_env_script(
        libexec / "xberg",
        ORT_DYLIB_PATH: "#{Formula["onnxruntime"].opt_lib}/libonnxruntime.dylib"
      )
    else
      # `cargo install --root #{prefix}` (via std_cargo_args) already installs the
      # real binary at #{prefix}/bin/xberg — nothing else to do. (A previous
      # `bin.install_symlink(bin/"xberg" => "xberg")` here force-overwrote that
      # binary with a self-referential dangling symlink, producing empty bottles;
      # see xberg-io/xberg#1356.)
      # `heic` re-adds HEIC/HEIF (dropped from the CLI default for #1361 so
      # `cargo install` works on stock Windows); Homebrew has libheif as a dep.
      system("cargo", "install", "--features", "api,mcp,mcp-http,heic", *std_cargo_args(path: "crates/xberg-cli"))
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xberg --version")
  end
end
