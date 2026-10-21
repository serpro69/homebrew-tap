class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.18.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.1/capy_0.18.1_darwin_arm64.tar.gz"
      sha256 "840d5fc9388074032778f27b10209511add180be11a5c8b30cd9219c5ea017a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.1/capy_0.18.1_linux_arm64.tar.gz"
      sha256 "3ae5b43702c0114b72ced526231d00e9fd9e3024505888c95adb9589fe981525"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.18.1/capy_0.18.1_linux_amd64.tar.gz"
      sha256 "4f42087a9917b03564d7a7a9c1b5b94d04356e6ab28625b3b47cb780f2c49936"
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
