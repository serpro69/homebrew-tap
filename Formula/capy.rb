class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.7.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.0/capy_0.7.0_darwin_arm64.tar.gz"
      sha256 "bda33f8edbce9caa13e2f9b5d0fb0ac6e615c24e44a217353c6cf4b3b533b629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.0/capy_0.7.0_linux_arm64.tar.gz"
      sha256 "74fa67b69739b14e299cb6101bef39d716f9f0a6ed6205c22bb0f9f1f9178b0d"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.7.0/capy_0.7.0_linux_amd64.tar.gz"
      sha256 "3f37be614ff932fe3b58cbb3de0e99f39b874ab868b54013063340fdf8ee6ea4"
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
