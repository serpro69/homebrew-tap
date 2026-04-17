class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.4.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.4.0/capy_0.4.0_darwin_arm64.tar.gz"
      sha256 "79ba55179cb5b4f7cd8db06c0c1af48841e91ae139c9293404027a0e26db0ff6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.4.0/capy_0.4.0_linux_arm64.tar.gz"
      sha256 "6d8f789fe1f85da1af55a80690e4e773df9a48d668e70512949373a322ff8ffd"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.4.0/capy_0.4.0_linux_amd64.tar.gz"
      sha256 "267d8bc09fdd82b1d5b265fcb8d71c8bbd9b155c73dc1fb277e70f1cbd34c80d"
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
