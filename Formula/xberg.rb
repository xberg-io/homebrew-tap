# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.3.7/xberg-1.3.7.tar.gz"
  sha256 "388e2e293cc0d3e1bbed4738d010375e30c689fbdbe2978c10e1a11f3d1fe3cf"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.3.7"
    sha256 cellar: :any, arm64_linux: "ea4247698a3e2c979d6b774726844a1bc733960ebc73949ff3586f553c3ac678"
    sha256 cellar: :any, arm64_tahoe: "17f188c6ce700e84616f588765291d892a0562f4fe845829089c1937e6d65453"
    sha256 cellar: :any, x86_64_linux: "e1177eb7e3af71494af1a8bb29a3b0e0bf52d0442791f09501db2ae3fe446b5c"
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
