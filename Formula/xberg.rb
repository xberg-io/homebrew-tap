# typed: false
# frozen_string_literal: true

class Xberg < Formula
  desc "High-performance document intelligence CLI"
  homepage "https://xberg.io"
  url "https://github.com/xberg-io/xberg/releases/download/v1.0.0-rc.35/xberg-1.0.0-rc.35.tar.gz"
  sha256 "cd00dc96aaf53428afb44191f18b616742c83cc423c11bb671d0e115b516ed91"
  license "MIT"

  bottle do
    root_url "https://github.com/xberg-io/xberg/releases/download/v1.0.0-rc.35"
    sha256 cellar: :any_skip_relocation, arm64_linux: "36c42bf175d44f8445bd257a326806d9da6a2f5f3180e64ff74d25c9f0904735"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "b1cd1c4dc5e9dd9560ff45a6dd77887e5a4314886cbc5704061f8a0a60c809b6"
    sha256 cellar: :any, sequoia: "ae9df9541cf2ad0d5fb167bb8fcc6e5df45ca788b6be33898abbfd94d33c751a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "19534abeeafcee70aed85c99c14d2deeb30ba624c350514cc4bec7a4bfd1ac44"
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
