class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.2.0"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.2.0/capy_0.2.0_darwin_arm64.tar.gz"
      sha256 "1b7cd2d0ec5adf24ad43006735a9e5ae984bc51713e5e4d3b1a2602ef0f9070e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.2.0/capy_0.2.0_linux_arm64.tar.gz"
      sha256 "d82c2fe2da0f3b63a677f3737a5605d7892e471a6630eb3d253c9a00ca495428"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.2.0/capy_0.2.0_linux_amd64.tar.gz"
      sha256 "fce55f8e537574e69b7d6fceb2ba62fec2badafe6396422518c89626d00f8f37"
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
