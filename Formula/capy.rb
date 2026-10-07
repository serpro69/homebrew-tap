class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.8"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.8/capy_0.16.8_darwin_arm64.tar.gz"
      sha256 "8fffd6f1035f1be28105c52885619b36f341b0b05a1d00a5b45c5b00da13f4d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.8/capy_0.16.8_linux_arm64.tar.gz"
      sha256 "1e9517367e8aa95b62298a10ff082e430aaca21cd6f1de9700f1394aae21f9bb"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.8/capy_0.16.8_linux_amd64.tar.gz"
      sha256 "6e146b35f91f7a281189db9ea7c65c8fb868799eeda1a15eeec1941e5745aac4"
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
