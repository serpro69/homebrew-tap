class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.10.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.0/capy_0.10.0_darwin_arm64.tar.gz"
      sha256 "8b5b13f73a4b513d7647bb7789c6e338426f45aa611657b959ba87eb75305527"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.10.0/capy_0.10.0_linux_arm64.tar.gz"
      sha256 "c7fd710a74552f2c0beedfec1dbfdca9d4141871a780b7db494ca166f3b10e8f"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.10.0/capy_0.10.0_linux_amd64.tar.gz"
      sha256 "27d92716f0258de4c7037fbaab3ac926f675bbf61e334ca2c943d75a7bd3227d"
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
