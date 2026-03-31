class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.1.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.3/capy_0.1.3_darwin_arm64.tar.gz"
      sha256 "79a320dd370590d124fae8aab62deaade9ece736eb1d9fe6307e0f60156c5c26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.3/capy_0.1.3_linux_arm64.tar.gz"
      sha256 "9b5a7401df2ab22dc1c1f8c33189bee8e64ee42570712db9b77395f56fe9ee7a"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.1.3/capy_0.1.3_linux_amd64.tar.gz"
      sha256 "a6193e3275933e0fbe7b32468306c93f2d521fb05b2dc6d08a92b4ae16b0c838"
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
