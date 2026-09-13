class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.15.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.15.1/capy_0.15.1_darwin_arm64.tar.gz"
      sha256 "cf10784d83e6ef33e742380956d4264b1f07af06310aed6cbbf3e64471aa8238"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.15.1/capy_0.15.1_linux_arm64.tar.gz"
      sha256 "91fb9d06fb8d2db0d1b81c3390af0b11471f868bbe5c9bcd14dea33e36f22b03"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.15.1/capy_0.15.1_linux_amd64.tar.gz"
      sha256 "7a3fbe34317aff1972903db2d34c326074adf08fb08c6e716bd1b4461983b57e"
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
