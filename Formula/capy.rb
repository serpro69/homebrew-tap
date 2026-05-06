class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.7.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.1/capy_0.7.1_darwin_arm64.tar.gz"
      sha256 "0d5a3d67e7cd392102c16ee7a78566ddc7675d2078e706c4dd7a7fed2f1c83ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.1/capy_0.7.1_linux_arm64.tar.gz"
      sha256 "0c4bfac23fe8e53eb211637cf1c713422cba8c339f2974050e3ec8126433d2d8"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.7.1/capy_0.7.1_linux_amd64.tar.gz"
      sha256 "d39bbea948bf6a64d4422e12ad229fe0724198a057021837bcaa0461275052d6"
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
