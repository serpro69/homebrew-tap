class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.3.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.3/capy_0.3.3_darwin_arm64.tar.gz"
      sha256 "4882fde0e84a52154d855e5119ea2af7b0bca2f8808cd7311f103e421fccf69c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.3/capy_0.3.3_linux_arm64.tar.gz"
      sha256 "bd662006072f9c4c20921b0848f2a692668515e46f96ed2eae1d5a6871b6db9e"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.3.3/capy_0.3.3_linux_amd64.tar.gz"
      sha256 "91a8feb311d6692037024e04956cacb5d024f0fa82fff55a029eb290c93d5b59"
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
