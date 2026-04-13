class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.3.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.2/capy_0.3.2_darwin_arm64.tar.gz"
      sha256 "5cb6f9c50e293e96ea2d7b4c0ce7ec1c196bd68d9d373acbf657d77ef4ea55ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.2/capy_0.3.2_linux_arm64.tar.gz"
      sha256 "cc0a054c2810b54bc39ace7c174bfe24f82541bfb18b50a27f6fcdc72e2f53fd"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.3.2/capy_0.3.2_linux_amd64.tar.gz"
      sha256 "6d3f3feb23822da8f0c4b6bf38aeb08780ba3dc562a5659db57cd2ba68643564"
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
