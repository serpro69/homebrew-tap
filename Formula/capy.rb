class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.12.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.12.0/capy_0.12.0_darwin_arm64.tar.gz"
      sha256 "9e5cf4012e95a15cae512444b351d67eec5f947093ac6764dc230b1f68d79fcf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.12.0/capy_0.12.0_linux_arm64.tar.gz"
      sha256 "f4488da1731774674b61438efc31d9d9174faa4940bb40bb2a6f954dda058775"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.12.0/capy_0.12.0_linux_amd64.tar.gz"
      sha256 "b6f11d22a138c1563ce784e5c89ed1942396d541d730b3571716f7472e56c8b5"
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
