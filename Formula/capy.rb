class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.2.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.2.1/capy_0.2.1_darwin_arm64.tar.gz"
      sha256 "b844752e5f4485d5484815be977c6e771529aabafdd31a263cd3971769052a12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.2.1/capy_0.2.1_linux_arm64.tar.gz"
      sha256 "7c116172f42cab87d04a25e8c1deadc9d5fad1faaf9b77c40ff31278fee3fc54"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.2.1/capy_0.2.1_linux_amd64.tar.gz"
      sha256 "a0f6126c2dd3f81b77c74a7ef044ad5c3eede2234c91775ce8d866f70b6b6bbf"
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
