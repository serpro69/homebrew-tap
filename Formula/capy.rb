class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.1/capy_0.16.1_darwin_arm64.tar.gz"
      sha256 "c2f28d43e670c4051b0451ff2768831b766b8e4255bd9d1d106771161601a08f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.1/capy_0.16.1_linux_arm64.tar.gz"
      sha256 "42a529c8aa658e12148369832821161a1badcd9c58271ddd546361726b98f2c5"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.1/capy_0.16.1_linux_amd64.tar.gz"
      sha256 "7a296206880d081fbdc900299dadbccbec2e676d8c325d5fee9ffc6319f9e886"
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
