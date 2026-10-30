class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.18.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.3/capy_0.18.3_darwin_arm64.tar.gz"
      sha256 "93e708dca042e94df8251576e4aa86909970b9c125b87ef45f84ac4222dfcba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.18.3/capy_0.18.3_linux_arm64.tar.gz"
      sha256 "692d076e821ea6dc916be7b7a730663cee576b30c5c856b931c3636f414d7787"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.18.3/capy_0.18.3_linux_amd64.tar.gz"
      sha256 "79acdb530d59fa64d766ee4e651897aba0df0f6fef3a835b34b2df30bd44bfc6"
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
