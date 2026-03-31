class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.1.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.2/capy_0.1.2_darwin_arm64.tar.gz"
      sha256 "cc4c89a807bb07ac4c8e9beb0a1bb26931d1fdccbd3a09366b7dea3e95ad2bfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.1.2/capy_0.1.2_linux_arm64.tar.gz"
      sha256 "41cb7c830804626165a1993ba6c7e020301a61f37c1e5f9f70a19e2aebb7b8e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.1.2/capy_0.1.2_linux_amd64.tar.gz"
      sha256 "a531504391ff7b692510a593e2a1879c1218f8a9327aa6063d22e9c32edb971e"
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
