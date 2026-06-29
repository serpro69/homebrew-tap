class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.11.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.11.0/capy_0.11.0_darwin_arm64.tar.gz"
      sha256 "3d4617002b300dbaead43994e6d4ebc4f1929e5e73ff17411b1871a6f3ea52f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.11.0/capy_0.11.0_linux_arm64.tar.gz"
      sha256 "b710cba82db8d71859f58dcb0a2faf51b4ef3f9fd830d440f65d113b1ecb941c"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.11.0/capy_0.11.0_linux_amd64.tar.gz"
      sha256 "6cbb8b9cb51aec9b4921a0983dcbf4dc33834f0bb6d36a15cc8c288e81461555"
    end
  end

  def install
    bin.install "capy"
    generate_completions_from_executable(bin/"capy", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/capy --version")
  end
end
