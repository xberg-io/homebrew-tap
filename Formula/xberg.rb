# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.0.11/xberg-1.0.11.tar.gz"
  sha256 "5a8dcde141503e60fefd486688279ae4e1b4dd4c5433bb0d3d81b2b5fa54e744"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.11"
    sha256 cellar: :any, arm64_linux: "41b449b2bc307fb808726b270ad03fbe15a0d0afb78f0675d055df1fd0fbeb7f"
    sha256 cellar: :any, arm64_tahoe: "acf5fa221319807a72c9120fd7b6632da17453569f9c46badfb90da4ffda970b"
    sha256 cellar: :any, sequoia: "04cf49325ceb428d5e0689139b0499dc07b2226e5836c217283b5e4985c426c8"
    sha256 cellar: :any, x86_64_linux: "4c467d1d8ab51868dd6f09e61037ce09bd0848f5ab5f4c3e46081c8b6101fe94"
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
