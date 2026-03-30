class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.1.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.0/capy_0.1.0_darwin_arm64.tar.gz"
      sha256 "a0349cf9f783ea020a1873f6ce6f929e4ad78a045a2a1fa9a07901a021a3278d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.0/capy_0.1.0_linux_arm64.tar.gz"
      sha256 "5b7d44887e69712eb0a4567d81898bfbe9e97aee9e665bfef0f48d013adec801"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.1.0/capy_0.1.0_linux_amd64.tar.gz"
      sha256 "719407ace31fed8f09c1f58f545f6b218011d3e74ba3473efdce605df78a2f36"
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
