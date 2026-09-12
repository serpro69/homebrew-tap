class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.14.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.14.0/capy_0.14.0_darwin_arm64.tar.gz"
      sha256 "55f6f3ba6139c06970bbc67c5ae3a91359148d94c90d418bc83af06e97716a89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.14.0/capy_0.14.0_linux_arm64.tar.gz"
      sha256 "01be8099468183a4f03925480f43913f8546185888dae64ddc6093d7ff18414b"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.14.0/capy_0.14.0_linux_amd64.tar.gz"
      sha256 "3cd1b656bb09aa06eda39ba6b18e0072cdc43bd0da37a45e9cb4eadbd0f91459"
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
