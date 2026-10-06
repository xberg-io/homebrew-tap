# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.3.5/xberg-1.3.5.tar.gz"
  sha256 "e5832a370ac84ac2968d78f3ad9ba0a2802198b920d1dda502767fc7b3bd4ce7"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.3.5"
    sha256 cellar: :any, arm64_linux: "4cd3ba5a22c0550b1fa3d813f576e540bd1df5a98af1f30d19559bf6d306373e"
    sha256 cellar: :any, arm64_tahoe: "bdc9f66ca05930a660715a6d4d88d0e81da58ee20ba6a7a2f826a04448f72ed3"
    sha256 cellar: :any, x86_64_linux: "13c10602e08eaf11686e8aea6d9f5493580c8d2610b75efdd4daeeecc2b24a8f"
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
