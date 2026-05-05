class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.6.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.3/capy_0.6.3_darwin_arm64.tar.gz"
      sha256 "045e39c3b53bfe23cfa2f1ac1adc4a8b9d7534396bb0e787dc053af2d2b75079"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.3/capy_0.6.3_linux_arm64.tar.gz"
      sha256 "16b9b5eb759c8dd2812cdd13cfe42b6231ff46591546062ccd05426f17e4bfcf"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.6.3/capy_0.6.3_linux_amd64.tar.gz"
      sha256 "e0b2422744db31a866fcf6d0ee1202e37b271c983a44ba0922075813b3f43011"
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
