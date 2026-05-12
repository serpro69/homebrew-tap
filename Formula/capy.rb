class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.9.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.2/capy_0.9.2_darwin_arm64.tar.gz"
      sha256 "f6db07a04508d8c691eddd24cb3cdb23628113803ac3d60a84e338a3e4f8d7bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.9.2/capy_0.9.2_linux_arm64.tar.gz"
      sha256 "cc24c4a9558bd3c28a8e7fc97e9da458031c173cede1ae07f9a26a5db3da5967"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.9.2/capy_0.9.2_linux_amd64.tar.gz"
      sha256 "13cda534a916fa50b92277118128d981c9e7e2caafa4c65922feed21b4139838"
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
