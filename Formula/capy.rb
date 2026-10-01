class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.5"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.5/capy_0.16.5_darwin_arm64.tar.gz"
      sha256 "3c5fcfb7b76df6ce6e74ad52f52e247ccc55065159fc3ca8daa07b4f6db7d7f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.5/capy_0.16.5_linux_arm64.tar.gz"
      sha256 "feb4efcb6ff2c8abd820a6463ff45e8b7f16b63ca24eaa937791e427eb9e0f28"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.5/capy_0.16.5_linux_amd64.tar.gz"
      sha256 "7da6e18a37d6f7e110e91c07e44acf135eb81e11b882c30e5b93a54e8c8b6612"
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
