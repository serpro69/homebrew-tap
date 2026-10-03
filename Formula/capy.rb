class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.7"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.7/capy_0.16.7_darwin_arm64.tar.gz"
      sha256 "d7abe344685b8fc93f8b2a5ec2e7d34f5e31a25792d226d71676afa54d4e36d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.7/capy_0.16.7_linux_arm64.tar.gz"
      sha256 "796fc7cf6576a46ddd55bbb6fb145a239564b4c6957ef88209d8259db6bb3aa9"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.7/capy_0.16.7_linux_amd64.tar.gz"
      sha256 "6ae541c3d40a935e86845db3cc911429eb223499072c7ba69ac5131dbe586ab2"
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
