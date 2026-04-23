class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.5.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.5.0/capy_0.5.0_darwin_arm64.tar.gz"
      sha256 "eacb5869a03118956764565c87688943cfe228f4aa2417925705428f38f23805"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.5.0/capy_0.5.0_linux_arm64.tar.gz"
      sha256 "4a9fdf4fc2debbcbf1a8181f081dbabc69091e934dda658aca8b4d964a18e831"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.5.0/capy_0.5.0_linux_amd64.tar.gz"
      sha256 "d27e89a67cb6ec1236c74535fd9423ada6fb1555bbcc09164edaaa6376a78a84"
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
