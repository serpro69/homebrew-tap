class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.7.4"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.4/capy_0.7.4_darwin_arm64.tar.gz"
      sha256 "2eb038a2268ceff371ce1d8f0b495116d2ddb6864ebc56f336243bd8d08299e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.4/capy_0.7.4_linux_arm64.tar.gz"
      sha256 "c2890fc5c6b9de5dd03f721fb68a9b07b7d0a81132870165770e75578d3a24fc"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.7.4/capy_0.7.4_linux_amd64.tar.gz"
      sha256 "4e3800d5b92520f3b24c25937a25e40c1d21e970c5c0eed4d66fbb252676bf97"
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
