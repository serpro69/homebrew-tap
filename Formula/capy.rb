class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.7.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.2/capy_0.7.2_darwin_arm64.tar.gz"
      sha256 "ae176b20720441a4b670de74c0905a1804d8fd1ea2636decb537435fe5176036"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.7.2/capy_0.7.2_linux_arm64.tar.gz"
      sha256 "a49b8ff52e005056af8c24bd61dd5d29e7511f53f82d4bfb091698064907fdc2"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.7.2/capy_0.7.2_linux_amd64.tar.gz"
      sha256 "0d4fa48c60a89dd89e37b2582b4729196d6248279c75993ec34502e4a9e6b985"
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
