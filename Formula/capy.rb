class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.9.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.1/capy_0.9.1_darwin_arm64.tar.gz"
      sha256 "7a9adb6070fe3e0942ac8fc1486edafea8db7d4e87b6631eae7c2d3e2caed2c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.1/capy_0.9.1_linux_arm64.tar.gz"
      sha256 "351c7fd641e6b7bd21552cef0f0ea37db1e8ee686607a6922e44a4513c8cbc87"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.9.1/capy_0.9.1_linux_amd64.tar.gz"
      sha256 "5cf66f2bef623957b19e76d131b0a12363758b0e625593cbffce1bfd8f2fd575"
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
